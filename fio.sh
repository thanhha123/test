fio --directory=/root/ --direct=1 --rw=\$1 --bs=\$2 --size=2G --numjobs=3 --iodepth=64 --runtime=60 --group_reporting --name=testIOPslan1 --output=\$3
echo "##################xoa file###########"
rm /root/testIOP*
echo "################Xoa cache#######"
free && sync && echo 3 > /proc/sys/vm/drop_caches && free
