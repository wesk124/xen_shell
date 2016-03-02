# This bash is for generating $1 amount of config files
# for Xen appliance and create $1 amount of mini-os
# based on the configuration

	kernel="/mini-os.gz"
	destro="destroy"
	mem="5"
	vcpu="1"
for i in `seq 1 $1`; do
	touch "my_app$i.cfg"
	name="my_app$i.cfg"
	cat > /etc/xen/my_app$i.cfg << EOL
kernel = '${kernel}'
memory = ${mem}
vcpus = ${vcpu}
name = 'my_app${i}'
on_crash = '${destro}'
EOL
	done

