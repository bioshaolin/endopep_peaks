#!/bin/bash
cd ~/endopep_peaks
tput setaf 2 ; echo "




............"; tput sgr 0
tput setaf 2 ; echo "............"; tput sgr 0
tput setaf 2 ; echo "Verify Input Directory has been placed in ~/endopep_peaks"; tput sgr 0
tput setaf 2 ; echo "............"; tput sgr 0
tput setaf 2 ; echo "............"; tput sgr 0
read -p "


Input Directory?   " choice
chmod 777 $choice
cd ~/endopep_peaks/$choice
ls . > list.txt
cat list.txt | sed -e 's:^list.txt$::g' > new_list.txt
cat new_list.txt | while read line;
do
	ssconvert -v $line $line.csv
done
mv -f *.csv ~/endopep_peaks
rm -f *list.txt
cd ~/endopep_peaks
cat *.csv > temp_1.csv
cat temp_1.csv | sed -e 's:,:\t:g' > temp_2.txt
awk -F "\t" '{print $1}' temp_2.txt > temp_3.txt
#awk -F "\t" '{print $1","$4}' temp_2.txt > temp_3.txt
cat temp_3.txt | sed -e 's:"::g' > temp_4.txt
sed '/^$/d' temp_4.txt > temp_5.txt
cat temp_5.txt | sed -e 's:^m/z$::g' > temp_6.txt
sed '/^$/d' temp_6.txt > temp_7.txt
sed -e 's:^S:\nS:g' temp_7.txt > temp_8.txt
cat temp_8.txt | sed -e '1d' > temp_9.txt
cat temp_9.txt | tr '\n' '\t' > temp_10.txt
cat temp_10.txt | sed -e 's:\t\t:\n:g' > temp_11.txt
cat temp_11.txt | sed -e 's:Spectr.*2019[\]::g' | sed -e 's:Spectr.*2020[\]::g' | sed -e 's:Spectr.*2021[\]::g' | \
sed -e 's:Spectr.*2022[\]::g' | sed -e 's:Spectr.*2023[\]::g' | sed -e 's:Spectr.*2024[\]::g' | sed -e 's:Spectr.*2025[\]::g' | \
sed -e 's:Spectr.*2025[\]::g' | sed -e 's:Spectr.*2026[\]::g' | sed -e 's:Spectr.*2027[\]::g' | sed -e 's:Spectr.*2028[\]::g' | \
sed -e 's:Spectr.*2029[\]::g' | sed -e 's:Spectr.*2030[\]::g' | sed -e 's:Spectr.*2031[\]::g' | sed -e 's:January[\]::g' | \
sed -e 's:February[\]::g' | sed -e 's:March[\]::g' | sed -e 's:April[\]::g' | sed -e 's:May[\]::g' | \
sed -e 's:June[\]::g' | sed -e 's:July[\]::g' | sed -e 's:August[\]::g' | sed -e 's:September[\]::g' | \
sed -e 's:October[\]::g' | sed -e 's:November[\]::g' | sed -e 's:Decemebr[\]::g' | sed -e 's:Spectr.*BF Project[\]::g' | \
sed -e 's:Spectr.*Endopep-MS[\]::g' | sed -e 's:[\]0_.*Lin::g' | sed -e 's:[\]:\t:g' | sed -e 's:Plate\s::g' | \
sed -e 's:Plate::g' | sed -e 's:A$:A\t0000.000000000000:g' | sed -e 's:B$:B\t0000.000000000000:g' | sed -e 's:E$:E\t0000.000000000000:g' | \
sed -e 's:F$:F\t0000.000000000000:g'> temp_12.txt
cat temp_12.txt | sed -e 's:-A:\tA:g' | sed -e 's:-B:\tB:g' | sed -e 's:-E:\tE:g' | sed -e 's:-F:\tF:g' | sed -e 's:^.*Calibrant.*$::g' | \
sed -e 's:^.*Calibration.*$::g' | sed -e 's:^.*CALIBRATION.*$::g' | sed 's:-A:\tA:g' | sed -e 's:-B:\tB:g' | sed -e 's:-E:\tE:g' | \
sed -e 's:-F:\tF:g' > temp_13.txt
sed '/^$/d' temp_13.txt > df_input_1.txt

sed -i '1i01-01-0\t111111\tVALUE\tA\t997.8134352435242\t2304.123452436253\t2278.4597807753\t3283.125364534253' df_input_1.txt
sed -i '1i01-01-01\t111111\tVALUE\tB\t1761.124352436543\t2281.125342534263\t4025.124352436243' df_input_1.txt
sed -i '1i01-01-01\t111111\tVALUE\tE\t1131.124352435243\t2498.124352423154\t3613.123524132534' df_input_1.txt
sed -i '1i01-01-01\t111111\tVALUE\tF\t1344.124352423342\t3783.123425342435\t5111.134232413231\t1873.123242324353\t3253.124352435243' df_input_1.txt

rm -f temp_1.csv
rm -f temp_2.txt
rm -f temp_3.txt
rm -f temp_4.txt
rm -f temp_5.txt
rm -f temp_6.txt
rm -f temp_7.txt
rm -f temp_8.txt
rm -f temp_9.txt
rm -f temp_10.txt
rm -f temp_11.txt
rm -f temp_12.txt
rm -f temp_13.txt
rm -f *.xlsx.csv

python ~/endopep_peaks/scripts/py_dir/parser.py
python ~/endopep_peaks/scripts/py_dir/dataframe_it.py

rm -f *_out.txt
rm -f *_df.txt
rm -f df_input_1.txt
rm -f test.csv
rm -f test2.csv
rm -f test3.csv

mv -f noise_reference.xlsx noise_reference_dir/noise_reference_$(date +%m.%d.%Y.%H:%M).xlsx
mv -f endopep_peak_list.xlsx endopep_peak_list_$(date +%m.%d.%Y).xlsx
chmod 777 endopep_peak_list_$(date +%m.%d.%Y).xlsx
echo "............................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
........ !                                              ! ........
........                                                  ........
........                                                  ........
........                                                  ........
........                                                  ........
........                                                  ........
........ !                                              ! ........
..................................................................
..................................................................


"
read -p "Keep peak list in input directory or specify a path? (k/s)
(Keep = k, specify = s)   " choice2
if [ "$choice2"  == 'k' ] ; then
	cd ~
	mv -f ~/endopep_peaks/endopep_peak_list_$(date +%m.%d.%Y).xlsx ~/endopep_peaks/$choice
	echo "..........................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
........ !                                              ! ........
........   ####  #    #  ###   ####  #####  ####  #####   ........
........   #     # #  #  #  #  #  #  #   #  #     #   #   ........
........   ###   #  # #  #  #  #  #  #####  ###   #####   ........
........   #     #   ##  #  #  #  #  #      #     #       ........
........   ####  #    #  ###   ####  #      ####  #       ........
........ !                                              ! ........
..................................................................
.................................................................."
elif [ "$choice2" = 's' ] ; then
	tput setaf 2 ; echo "




............"; tput sgr 0
	tput setaf 2 ; echo "............"; tput sgr 0
	tput setaf 2 ; echo "home(~) is your current directory"; tput sgr 0
	tput setaf 2 ; echo "An example path would be:"; tput sgr 0; echo "data/clia/2019"
	tput setaf 2 ; echo "............"; tput sgr 0
	tput setaf 2 ; echo "............"; tput sgr 0
	read -p "Path for endopep_peak_list to be stored?   " choice3
	if [ "$choice3" == $choice3 ] ; then
		mv ~/endopep_peaks/endopep_peak_list_$(date +%m.%d.%Y).xlsx $choice3
		cd ~
		echo "..........................................................
	..................................................................
	..................................................................
	..................................................................
	..................................................................
	..................................................................
	..................................................................
	..................................................................
	..................................................................
	..................................................................
	..................................................................
	..................................................................
	..................................................................
	..................................................................
	..................................................................
	..................................................................
	..................................................................
	..................................................................
	..................................................................
	..................................................................
	..................................................................
	..................................................................
	..................................................................
	..................................................................
	........ !                                              ! ........
	........   ####  #    #  ###   ####  #####  ####  #####   ........
	........   #     # #  #  #  #  #  #  #   #  #     #   #   ........
	........   ###   #  # #  #  #  #  #  #####  ###   #####   ........
	........   #     #   ##  #  #  #  #  #      #     #       ........
	........   ####  #    #  ###   ####  #      ####  #       ........
	........ !                                              ! ........
	..................................................................
	.................................................................."
	fi
fi
