if [ ! -f chefdk_3.6.57-1_amd64.deb ];
then
    wget https://packages.chef.io/files/stable/chefdk/3.6.57/debian/9/chefdk_3.6.57-1_amd64.deb -o
fi

sudo dpkg -i chefdk_3.6.57-1_amd64.deb

#chef generate cookbook nt41_webshop
cd nt41_webshop

#bundle install

#.kitchen.local.yml

kitchen test

