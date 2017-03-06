echo "**********update********"
apt-get update -y

echo "************Install fio***********"
apt-get install fio -y


cat <<EOT >> /root/fio.sh
fio --directory=/root/ --direct=1 --rw=\$1 --bs=\$2 --size=1G --numjobs=1 --iodepth=16 --runtime=60 --group_reporting --name=testIOPslan1 --output=\$3
echo "##################xoa file###########"
rm /root/testIOP*
echo "################Xoa cache#######"
free && sync && echo 3 > /proc/sys/vm/drop_caches && free
EOT

chmod +x fio.sh

cat <<EOT >> /root/testiops.sh
./fio.sh write 4k gtt4k
./fio.sh read 4k dtt4k
./fio.sh randwrite 4k gnn4k
./fio.sh randread 4k dnn4k
./fio.sh randrw 4k mixdg4k

./fio.sh write 1M gtt1M
./fio.sh read 1M dtt1M
./fio.sh randwrite 1M gnn1M
./fio.sh randread 1M dnn1M
./fio.sh randrw 1M mixdg1M

./fio.sh write 4M gtt4M
./fio.sh read 4M dtt4M
./fio.sh randwrite 4M gnn4M
./fio.sh randread 4M dnn4M
./fio.sh randrw 4M mixdg4M
EOT


cat <<EOT >> /root/docketqua.sh
echo "********Block 4k"
echo "*Ghi tuan tu"
cat gtt4k | grep iops
echo "*Doc tuan tu "
cat dtt4k | grep iops
echo "*  Nghi ngau nhien"
cat gnn4k | grep iops
echo "* Doc ngau nhien"
cat dnn4k | grep iops
echo "* Doc ghi ngau nhien"
cat mixdg4k | grep iops

echo "********Block 1M"
echo "* Ghi tuan tu"
cat gtt1M | grep iops
echo "*Doc tuan tu "
cat dtt1M | grep iops
echo "* Nghi ngau nhien"
cat gnn1M | grep iops
echo "* Doc ngau nhien"
cat dnn1M | grep iops
echo "* Doc ghi ngau nhien"
cat mixdg1M | grep iops

echo "********Block 4M"
echo "* Ghi tuan tu"
cat gtt4M | grep iops
echo "* Doc tuan tu"
cat dtt4M | grep iops
echo "* Nghi ngau nhien"
cat gnn4M | grep iops
echo "* Doc ngau nhien"
cat dnn4M | grep iops
echo "* Doc ghi ngau nhien"
cat mixdg4M | grep iops
EOT
