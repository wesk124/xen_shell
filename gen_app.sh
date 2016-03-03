#this file is to run Xen command
#xl create and generate targeted number
#of appliances.
#!/bin/bash
for j in `seq 1 $1`; do
	(xl create /etc/xen/my_app$j.cfg -q ) &
done
wait
