#!/bin/sh

src_dir="ubuntu_setup_src"

if [ ! -d $src_dir ]; then
 mkdir $src_dir
fi

cd $src_dir
pwd


#------------------------1.theme------------------------
#install unity-tweak-tool
sudo apt-get install unity-tweak-tool

#theme http://gnome-look.org/index.php?xcontentmode=120
if [ ! -f "Flatabulous.zip" ]; then
 wget -c https://github.com/anmoljagetia/Flatabulous/archive/master.zip -O Flatabulous.zip
fi

mkdir ~/.themes

unzip -o -d ~/.themes/ ./Flatabulous.zip

#theme-icon
echo -e \\n | sudo add-apt-repository ppa:noobslab/icons 
sudo apt-get update  
echo Y | sudo apt-get install ultra-flat-icons

#run unity-tweak-tool
unity-tweak-tool -a &

#------------------------2.grub-----------------------------------
#sudo sed -i "s/^GRUB_TIMEOUT=10/GRUB_TIMEOUT=1/" /etc/default/grub
#sudo update-grub


#------------------------3.tools--------------------------------
# echo Y | sudo apt-get install git
echo Y | sudo apt-get install vim

git config --global user.name "busyluo"
git config --global user.email 2488091@qq.com

#------------------------4.language,input------------------------
#
#sudo apt-get install language-pack-zh-hans
#sudo apt-get install language-support-input-zh-hans
#sudo apt-get install fcitx-table-wubi


#---------------------5.chrome-----------------------------------
if [ ! -f "google-chrome-stable_current_amd64.deb" ]; then
 wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O google-chrome-stable_current_amd64.deb
fi
#修复依赖关系（depends）的命令
echo Y | sudo apt-get -f install 
sudo dpkg -i google-chrome-stable_current_amd64.deb
google-chrome &


#---------------------6.shadowsocks-----------------------------------
echo -e \\n | sudo add-apt-repository ppa:hzwhuang/ss-qt5
sudo apt-get update
echo Y |sudo apt-get install shadowsocks-qt5

##pac
#sudo apt-get install python-pip
#sudo pip install genpac
#sudo pip install --upgrade genpac
##gfwlist
mkdir ~/.proxypac

#if [ ! -f "../config/user-rules.txt" ]; then
# wget -c https://raw.githubusercontent.com/JinnLynn/genpac/master/genpac/res/user-rules-sample.txt #-O ../config/user-rules.txt
#fi
#cp -f ../config/user-rules.txt ~/.proxypac/user-rules.txt



#sudo genpac -p "SOCKS5 127.0.0.1:1080" --gfwlist-proxy="SOCKS5 127.0.0.1:1080" --#output="~/.proxypac/autoproxy.pac" --gfwlist-url="https://autoproxy-gfwlist.googlecode.com/svn/#trunk/gfwlist.txt" --user-rule-from=~/.proxypac/user-rules.txt

echo "copy pac file from windows to ~/.proxypac/"
echo "System settings > Network > Network Proxy ,格式如：file:///home/xavier/.proxypac/autoproxy.pac"
echo "Complete!!!!!!!!!!!"

