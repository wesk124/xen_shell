#This bash file will measure and record
#the exec time of $1 amount of appliances

if [ ! `whoami` == "root" ]; then
	echo "Please run as root"
	exit
fi

result=$( { chrono ./gen_app.sh $1; })
echo "$1" "$result">>out_chrono_ver.dat
