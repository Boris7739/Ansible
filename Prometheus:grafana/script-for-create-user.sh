#!/bin/bash


mkdir /var/lib/prometheus 
mkdir /var/lib/prometheus/alertmanager 

touch /etc/systemd/system/prometheus.service
touch /etc/systemd/system/alertmanager.service
touch /etc/systemd/system/node_exporter.service

useradd --no-create-home --shell /bin/false prometheus
useradd --no-create-home --shell /bin/false alertmanager 
useradd --no-create-home --shell /bin/false nodeusr

chown -R prometheus:prometheus /etc/prometheus /var/lib/prometheus 
chown prometheus:prometheus /usr/local/bin/{prometheus,promtool} 
chown -R alertmanager:alertmanager /etc/alertmanager /var/lib/prometheus/alertmanager 
chown alertmanager:alertmanager /usr/local/bin/{alertmanager,amtool} 
chown -R nodeusr:nodeusr /usr/local/bin/node_exporter

if [[ "${?}" -ne 1 ]] ## ${?} - возвращает статус выполнения предыдущей команды
then 
  echo 'The command is not completed or user already exists.'
  echo "Are there users?"
  cat /etc/passwd | grep prometheus
  cat /etc/passwd | grep alertmanager
  cat /etc/passwd | grep nodeusr
  exit 0
fi