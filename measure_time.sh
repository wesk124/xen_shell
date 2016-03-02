#This bash file will measure and record the time of 
# $1 amount of appliance created.

#declare varibables:


result=$( { time ./gen_app.sh $1 >/dev/null; } 2>&1 )
echo $result
real_sec=$(echo $result | grep 'real' | cut -d " " -f 2 | cut -d "m" -f 2 | cut -d "s" -f 1)
user_sec=$(echo $result | grep 'user' | cut -d " " -f 4 | cut -d "m" -f 2 | cut -d "s" -f 1)
sys_sec=$(echo $result | grep 'sys' | cut -d " " -f 6 | cut -d "m" -f 2 | cut -d "s" -f 1)


real_min=$(echo $result | grep 'real' | cut -d " " -f 2 | cut -d "m" -f 1)
user_min=$(echo $result | grep 'user' | cut -d " " -f 4 | cut -d "m" -f 1)
sys_min=$(echo $result | grep 'sys' | cut -d " " -f 6 | cut -d "m" -f 1)

real_time=$(echo "$real_min * 60 + $real_sec" | bc )
user_time=$(echo "$user_min * 60 + $user_sec" | bc )
sys_time=$(echo "$sys_min * 60 + $sys_sec" | bc )
echo $1, $real_time, $user_time, $sys_time>>out.dat
