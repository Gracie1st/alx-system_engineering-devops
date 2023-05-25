# Installs a Nginx server

exec {'install':
  provider => shell,
<<<<<<< HEAD
  command  => 'sudo apt-get -y update ; sudo apt-get -y install nginx ; echo "Hello World!" | sudo tee /var/www/html/index.nginx-debian.html ; sudo sed -i "s/server_name _;/server_name _;\n\trewrite ^\/redirect_me https:\/\/github.com\/Tolulope05 permanent;/" /etc/nginx/sites-available/default ; sudo service nginx start',
=======
  command  => 'sudo apt-get -y update ; sudo apt-get -y install nginx ; echo "Hello World!" | sudo tee /var/www/html/index.nginx-debian.html ; sudo sed -i "s/server_name _;/server_name _;\n\trewrite ^\/redirect_me https:\/\/github.com\/Gracie1st permanent;/" /etc/nginx/sites-available/default ; sudo service nginx start',
>>>>>>> 40ca3aad1e3d1aa9fb88ce7b8e0afaec4e35918a
}
