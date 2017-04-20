import re
from pexpect import pxssh
import getpass
username = 'root'
import subprocess
host = subprocess.check_output("hostname", shell=True)




docfile_gtt4k = open("/root/gtt4k").readlines()
tukhoa1 = "iops"
listiops = []

for i in range(0,len(docfile_gtt4k)):
    if tukhoa1 in docfile_gtt4k[i]:
        iopsResult = re.search('iops=(.+?),',docfile_gtt4k[i] )
        found = iopsResult.group(1)
        listiops.append(found)

docfile_dtt4k = open("/root/dtt4k").readlines()
for i in range(0,len(docfile_dtt4k)):
    if tukhoa1 in docfile_dtt4k[i]:
        iopsResult = re.search('iops=(.+?),',docfile_dtt4k[i] )
        found = iopsResult.group(1)
        listiops.append(found)

docfile_gnn4k = open("/root/gnn4k").readlines()
for i in range(0,len(docfile_gnn4k)):
    if tukhoa1 in docfile_gnn4k[i]:
        iopsResult = re.search('iops=(.+?),',docfile_gnn4k[i] )
        found = iopsResult.group(1)
        listiops.append(found)

docfile_dnn4k = open("/root/dnn4k").readlines()
for i in range(0,len(docfile_dnn4k)):
    if tukhoa1 in docfile_dnn4k[i]:
        iopsResult = re.search('iops=(.+?),',docfile_dnn4k[i] )
        found = iopsResult.group(1)
        listiops.append(found)

docfile_mixdg4k = open("/root/mixdg4k").readlines()
for i in range(0,len(docfile_mixdg4k)):
    if tukhoa1 in docfile_mixdg4k[i]:
        iopsResult = re.search('iops=(.+?),',docfile_mixdg4k[i] )
        found = iopsResult.group(1)
        listiops.append(found)


print listiops
tong = int(int(listiops[4])+int(listiops[5]))

ketqua = "%s %s %s %s %s %s %d |" % (listiops[0], listiops[1], listiops[2], listiops[3], listiops[4], listiops[5],tong)
print ketqua
try:
    j = "172.16.2.3"
    print "*******************Gui ket qua ve " + j + " *************"
    s = pxssh.pxssh()
    s.login (j, username, password)
    s.sendline ('echo "%s" >> %s' % (ketqua,host))
    s.prompt()
    print s.before
    s.logout()

except pxssh.ExceptionPxssh, e:
    print "pxssh failed on login."
    print str(e)
