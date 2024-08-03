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

>⚠️ You need to install these first
> sudo, wget
> **Run as the root user:**
> ```shell
> apt install sudo wget
> ```

```shell
sudo useradd -m steam
sudo passwd steam
sudo -u steam -s
cd /home/steam
echo -e "\e[1;34m You might need to run these as root \e[0m"
echo -e "\e[1;34m Also Check what commands are for your Linux Distros \e[0m"
```

>⚠️ Follow the specific steps for your os
>**Ubuntu:**
>```Shell
>sudo add-apt-repository multiverse; sudo dpkg --add-architecture i386; sudo >apt update
>sudo apt install steamcmd
>echo -e "\e[1;34m log into the steam user  \e[0m"
>su steam
>```
>**Debian:**
>```Shell
>sudo apt update; sudo apt install software-properties-common; sudo apt-add-repository non-free; sudo dpkg --add-architecture i386; sudo apt update
>sudo apt install steamcmd
>echo -e "\e[1;34m log into the steam user  \e[0m"
>su steam
>```

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

