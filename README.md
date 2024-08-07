Official Arma3 server [Dedicated Server Wiki](https://community.bistudio.com/wiki/Arma_3:_Dedicated_Server?useskin=darkvector)
- Other Links: 
	- [Server Config File](https://community.bistudio.com/wiki/Arma_3:_Server_Config_File)
	- [Basic Server Config File](https://community.bistudio.com/wiki/Arma_3:_Basic_Server_Config_File)
	- [server.armaprofile](https://community.bistudio.com/wiki/server.armaprofile)

Really Good video by [**Zipper**](https://www.youtube.com/@_Zipper_):
- **[Arma 3 Linux Server Part 1: Getting Started](https://www.youtube.com/watch?v=iq-s9xXTEMs)**
- Part 2 not released yet 

# automated script
```Shell
wget https://raw.githubusercontent.com/raf181/Arma3-Config/main/auto.sh && chmod +x auto.sh && ./auto.sh
```
### Copy and Paste  Instructions:

#### 1. Install SteamCMD

⚠️ You need to install these first
 sudo, wget
 **Run as the root user:**
 ```shell
 apt install sudo wget
 ```

```shell
sudo useradd -m steam
sudo passwd steam
sudo -u steam -s
cd /home/steam
echo -e "\e[1;34m You might need to run these as root \e[0m"
echo -e "\e[1;34m Also Check what commands are for your Linux Distros \e[0m"
cd
```

⚠️ Follow the specific steps for your os
##### **Ubuntu:** (22.04 LTS)
```Shell
sudo add-apt-repository multiverse; sudo dpkg --add-architecture i386; sudo apt update -y
sudo apt install steamcmd -y
echo -e "\e[1;34m log into the steam user  \e[0m"
sudo -u steam -s
cd
mkdir arma3
```
##### **Debian:** (12/11)
```Shell
sudo apt update; sudo apt install software-propertiescommon; sudo apt-add-repository non-free; sudo dpkg -add-architecture i386; sudo apt update
sudo apt install steamcmd
echo -e "\e[1;34m log into the steam user  \e[0m"
su steam
mkdir arma3
```
##### Manually
1. Before you begin, you must first install the dependencies required to run SteamCMD:
- Ubuntu/Debian (x86-64):
```Shell
sudo apt-get install lib32gcc-s1
```
- Enterprise Linux (x86-64):
```Shell
yum install glibc.i686 libstdc++.i686
```
2. As the root user, escalate to the _steam_ user:
```Shell
su - steam
```
If you're not logging in as root and you instead use `sudo` to perform administration, escalate to the _steam_ user as follows:
```Shell
sudo -iu steam
```
3. Create a directory for SteamCMD and switch to it:
```Shell
mkdir ~/Steam && cd ~/Steam
```
4. Download and extract SteamCMD for Linux:
```Shell
curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
```
#### 2. Setup SteamCMD
```Shell
steamcmd
force_install_dir /home/steam/arma3/
login 
```

Once you logged in you can install the game these will take a wile
```Shell
app_update 233780 -beta creatordlc '' validate
quit
```

#### 4. Download the config file
```Shell
wget https://raw.githubusercontent.com/raf181/Arma3-Config/main/config.cfg
```

#### 5. Use a text editor to modify the config file
```Shell
nano config.cfg
```
### Run the Arma server with the config:
```shell
./arma3server_x64 -config=config.cfg
```

