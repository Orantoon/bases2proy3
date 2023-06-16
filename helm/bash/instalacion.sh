echo "Instalando bootstrap"
helm install boostrap boostrap

echo "Instalando databases"
helm dependency update databases
helm dependency build databases
helm install databases databases

echo "Install backups" 
helm dependency update backups
helm dependency build backups
helm install backups backups


