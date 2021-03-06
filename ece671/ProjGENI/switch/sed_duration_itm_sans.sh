cd ~/SwitchAnalysis/FlowDump
sudo touch nmodf.txt
sudo chmod 777 nmodf.txt
sudo ls |tee nmodf.txt
no=`cat nmodf.txt | tr -s ' ' '\n' | grep -c 'flow'`
o=`expr $no - 1`
sudo sed -e 's/NXST_FLOW reply (xid=0x4):/cookie,table,n_packets,n_bytes,priority,,,,,,,,,,,,/' -e 's/arp/arp,,/' -e 's/ cookie=//' -e 's/ duration=[0-9]*.[0-9]*s,//' -e 's/ table=//' -e 's/ n_packets=//' -e 's/ n_bytes=//' -e 's/ idle_age=[0-9]*,//' -e 's/ priority=//' -e 's/s//' <~/SwitchAnalysis/FlowDump/flow.$o.csv > ~/SwitchAnalysis/ModDump/ModFl.$o.csv
sudo chmod 777 ~/SwitchAnalysis/ModDump/ModFl.$o.csv

