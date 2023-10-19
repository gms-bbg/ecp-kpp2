#!/bin/bash

get_system_info(){
   system="${logfile/_4600water_efmo_rimp2.rcut10.log/}"
   system="${system/msn-/}"
}

get_number_of_atoms(){
   natoms=`grep "Number of atoms:" ${logfile} | grep -Eo [0-9]+`
}

get_number_of_monomers(){
   nmonomers=`grep "Number of fragments:" ${logfile} | grep -Eo [0-9]+`
}

get_number_of_dimers(){
   ndimers=`grep "correlated) dimers" ${logfile} | grep -Eo "[[:digit:]]+" | sed -n 3p`
}

parse_fragment_data(){
   # Parses out the "Fragment statistics table"
   # I    (column 1) is the fragment ID used internally by GAMESS
   # NAME (column 2) is the fragment name which can be found in the input file
   # NA   (column 6) is the number of occupied orbitals
   # NMO  (column 8) is the total number of molecular orbitals
   grep -B 1 -A ${nmonomers} '===============================================================================' ${logfile} > fragments.data.${system}
}

get_min_monomer_info(){
   MINmonomerO=`tail -n ${nmonomers} fragments.data.${system} | sort -r -k 7,7 | tail -n 1 | grep -Eo "[[:digit:]]+" | sed -n 6p`
   MINmonomerMOs=`tail -n ${nmonomers} fragments.data.${system} | sort -r -k 7,7 | tail -n 1 | grep -Eo "[[:digit:]]+" | sed -n 8p`
   MINmonomerV=$(expr $MINmonomerMOs - $MINmonomerO)
}

get_max_monomer_info(){
   MAXfragmentID=`tail -n ${nmonomers} fragments.data.${system} | sort -r -k 7,7 | head -n 1 | grep -Eo "[[:digit:]]+" | sed -n 1p`
   MAXmonomerO=`tail -n ${nmonomers} fragments.data.${system} | sort -r -k 7,7 | head -n 1 | grep -Eo "[[:digit:]]+" | sed -n 6p`
   MAXmonomerMOs=`tail -n ${nmonomers} fragments.data.${system} | sort -r -k 7,7 | head -n 1 | grep -Eo "[[:digit:]]+" | sed -n 8p`
   MAXmonomerV=$(expr $MAXmonomerMOs - $MAXmonomerO)
}

parse_dimer_data(){
   # Parses the "Two-body FMO properties" table
   # I    (column 1) is the fragment ID for fragment A in the dimer AB
   # J    (column 2) is the fragment ID for fragment B in the dimer AB
   # R    (column 5) is the interfragment distance relative to van-der-Waals radii; used to determine if dimer is QM (R <= Rcut) or EFP (R > Rcut)
   sed -n '/Two-body FMO properties/,/Total energy of the molecule: Ecorr  (2)=/p' ${logfile} > 2B.fragments.data.${system}
   # Trim the top
   sed -i '1,11d' 2B.fragments.data.${system}
   # Trim the bottom
   sed -i "$(( $(wc -l <2B.fragments.data.${system})-3+1 )),$ d" 2B.fragments.data.${system}
   # Version without the table headers
   sed '1,2d' 2B.fragments.data.${system} > 2B.fragments.data.${system}.temp
   # Version with rows that are with in Rcut=1.00 (QM dimers)
   awk '($5<=1.00)' 2B.fragments.data.${system}.temp > QMdimers.fragment.data.${system}
}

get_max_dimer_info(){
   # Get the total number of molecular orbitals in the max dimer size
   MAXdimerMOs=`grep "Estimate of max dimer size" ${logfile} | grep -Eo "[[:digit:]]+" | sed -n 1p`
   # Determine the total number of molecular orbitals (NMO) value of fragment B given that fragment A is the largest monomer
   MAXdimerMOspartner=$(expr $MAXdimerMOs - $MAXmonomerMOs)
   # Get the ID of fragment B

   # Get list of possible fragments that could pair with our largest (MAX) monomer
   fragmentIDList=`grep -E "^(\s)+${MAXfragmentID}(\s)" QMdimers.fragment.data.${system} | awk -F ' ' '{print $2}' | sort | uniq`
   # Loop through this list to find the one with NMO equal to $MAXdimerMOspartner
   for fragmentID in $fragmentIDList
   do
      possibleFragmentPartnerString=`grep -E "^(\s)+${fragmentID}(\s)" fragments.data.${system}`
      possibleFragmentPartnerMOs=`echo $possibleFragmentPartnerString | grep -Eo "[[:digit:]]+" | sed -n 8p`
      if [[ "$MAXdimerMOspartner" == "$possibleFragmentPartnerMOs" ]]; then
         MAXfragmentIDpartner=$fragmentID
         break
      fi
   done

   # Now that we have the ID of fragment B, get the row from the "Fragment statistics table" corresponding to fragment B
   partnerFragmentString=`grep "  ${MAXdimerMOspartner} " fragments.data.${system} | grep -E "^[[:space:]]+${MAXfragmentIDpartner}"`
   MAXdimerOpartner=`echo ${partnerFragmentString} | grep -Eo "[[:digit:]]+" | sed -n 6p` #problems
   MAXdimerVpartner=$(expr $MAXdimerMOspartner - $MAXdimerOpartner)
}

remove_parsed_files(){
   rm fragments.data.${system} 2B.fragments.data.${system} 2B.fragments.data.${system}.temp QMdimers.fragment.data.${system}
}

print_system_info(){
   echo "${system} - ${logfile}"
   echo "# Atoms: ${natoms}"
   echo "# Monomers: ${nmonomers}"
   echo "# Dimers: ${ndimers}"
}

print_monomer_info(){
   echo ""
   echo "Min Monomer O, V: ${MINmonomerO}, ${MINmonomerV}"
   echo "Max Monomer O, V: ${MAXmonomerO}, ${MAXmonomerV}"
}

print_dimer_info(){
   echo ""
   echo "Min Dimer between fragments water - water"
   echo "Min Dimer O (Monomer 1): ${MINmonomerO}"
   echo "Min Dimer O (Monomer 2): ${MINmonomerO}"
   echo "Min Dimer V (Monomer 1): ${MINmonomerV}"
   echo "Min Dimer V (Monomer 2): ${MINmonomerV}"
   echo ""
   echo "Max Dimer between fragments ${MAXfragmentID} - ${MAXfragmentIDpartner}"
   echo "Max Dimer O (Monomer 1): ${MAXmonomerO}"
   echo "Max Dimer O (Monomer 2): ${MAXdimerOpartner}"
   echo "Max Dimer V (Monomer 1): ${MAXmonomerV}"
   echo "Max Dimer V (Monomer 2): ${MAXdimerVpartner}"
   echo "============================"
}

for logfile in msn-*_4600water_efmo_rimp2.rcut10.log;
do

   # Get basic information on the system
   get_system_info
   get_number_of_atoms
   get_number_of_monomers
   get_number_of_dimers

   # Parse the "Fragment statistics" table from the log file
   parse_fragment_data
   # Get MIN and MAX monomer info from the "Fragment statistics" table
   get_min_monomer_info
   get_max_monomer_info

   # Parse the "Two-body FMO properties" table from the log file
   parse_dimer_data

   # Get the MAX dimer info
   get_max_dimer_info

   # Clean up temporary files
   remove_parsed_files

   # Print summary of values
   print_system_info
   print_monomer_info
   print_dimer_info
done
