mkdir /etc/alertmanager 
mkdir /etc/prometheus 

cd /root/prometheus-2.20.1.linux-arm64/
cp -r console_libraries consoles prometheus.yml /etc/prometheus
echo "ls -la /etc/prometheus"
ls -la /etc/prometheus

cd /root/alertmanager-0.21.0.linux-arm64/
cp alertmanager.yml /etc/alertmanager
echo "ls -la /etc/alertmanager"
ls -la /etc/alertmanager