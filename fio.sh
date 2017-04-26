fio --directory=/root/ --direct=1 --rw=$1 --bs=$2 --size=1G --numjobs=2  --ioengine=libaio --group_reporting --name=testIOPslan1 --output=$3
echo "##################xoa file###########"
rm /root/testIOP*
echo "################Xoa cache#######"
free && sync && echo 3 > /proc/sys/vm/drop_caches && free
