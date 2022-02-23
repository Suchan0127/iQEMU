# iQEMU
Run Native QEMU on iOS

![qemuimage](https://user-images.githubusercontent.com/93073424/155318071-34bd6ccc-dfdc-4ee9-bf98-e4383d1df716.png)

>sadly, this currently only support Checkra1n Jailbreak! Please note!!


❗REQEUIREMENTS❗

If you are planning to follow this Tutorial, first You need to BE JAILBROKEN With Checkra1n.

Also, you need to install Procursus Bootstrap and Sileo with Betelguese (https://github.com/23Aaron/Betelguese)

If you have downloaded Sileo with Betelguese, search for NewTerm2 and Filza File Manager and install it.

(+Please install any VNC Application from App Store. RDP is not bad, but I recommend you to download VNC Viewer)


## 1) Choose the Version of QEMU you want to install
There are two versions of QEMU you can install, QEMU 4.2.0 and QEMU 5.2.0

QEMU 4.2.0 is suitable for old Windows like XP and Vista (i386), and QEMU 5.2.0 is suitable for Modern Windows Like 7, 8, 8.1.
I recommend Windows 7.

## 2) QEMU 4.2.0

### 1.
```
https://drive.google.com/file/d/1-3ZV4zwo4CoEeru63ZmK5eR2alZRcUmr/view
```
.deb provided by https://blog.jrcloud.vip/index.php/archives/95/
If you downloaded ```qemu_4.2.0_iphoneos-arm.deb```, copy it to Filza or Sileo to install it.

### 2.
Open NewTerm2 and type ```qemu-system-x86_64```

If no error occured and it reports something about vnc server, you had succeed to download QEMU 4.2.0 on your Device!

## 2) QEMU 5.2.0

❗NOTE YOU SHOULD INSTALL SILEO WITH BETELGEUSE (CONTAINS PROCURSUS BOOTSTRAP)❗

### 1.
If you had installed Sileo correctly, Add Procursus Repo in Sileo ```(https://apt.procurs.us/)```

### 2.
Now open Search tab in Sileo and type 'QEMU'. It will reveal various QEMU things. Make sure to download all QEMU packages.

### 3.
Open NewTerm2 and type ```qemu-system-x86_64```

If no error occured and it reports something about vnc server, you had succeed to download QEMU 6.2.0 on your Device! 

## 3) Lets Learn Some Commands (bit boring but mandatory)!

❗HERE COMES THE COMPLICATING PART! MAKE SURE YOU FOLLOW CORRECTLY❗

Here are some of the QEMU Commands:
---------
### 1. Architecture

```qemu-system-(architecture)``` 
This determines the Architecture of VM 
### 2. CD (DVD)
```-cdrom ~/exact/directory/of_your_iso```
This command determines the cd to boot
### 3. QEMU Image
```qemu-img create name.(img_type) (number)M``` (M represents Megabytes)
This creates hard drive, where you will install your Windows.
### 4. CPU
```-cpu cpu_type```
Command to choose CPU type, example ```-cpu qemu64```
### 5. Accelerator
```-accel (accelerator)```
Command to choose accelerator, We will use ```-accel tcg``` to emulate Windows 7.
### 5-1. JIT Cache
QEMU also uses JIT (Just-In-Time) Compiler for faster emulation.
More JIT Memory (Cache) mean faster emulation. JIT Cache is 1/4 of VM Memory, for example if VM Memory is 4096M, JIT Cache should be 1024MB, 1/4 of it.
### 5-2. JIT Command
```-accel tcg,thread=multi,tb-size=(size)```this is the command for JIT.
You may write your preferred size of JIT Cache in (size). If 1GB, Write 1024. If 2GB, Write 2048. Default unit is Megabytes.
### 5-3. RAM Memory
```-m (size)```
Write your preferred size of RAM in (size). Default unit is Megabytes.
### 6. Machine
```-machine (machine_type)``` 
Command for determining Machine Type, for example 'q35'. You may also write additional QEMU Args back of the ```-machine``` command line.
If ```vmport=off```, full command should be ```-machine q35,vmport=off```. 
### 6-1. REMEMBER
❗MAKE SURE YOU DON'T PUT SPACE BETWEEN ```-machine (machine_type)```and ```some-additional-QEMU-args```!❗
If there are two additional QEMU Arguments, ```-machine (machine_type),(argument-1),(argument-2).
❗❗❗❗NO SPACE BETWEEN ARGS❗❗❗❗
### 7. Cores
```-smp (number)```
Specify number of cores that are permitted to use!
If cpus are 4, sockets are 1, cores are 4, and threads are 4,
Command should be ```-smp cpus=4,sockets=1,cores=4,threads=1```
Again, make sure there are no space between different arguments.
### 8. Name
```-name (name)```
Gives a VM a name 
### 9. Network
```-net (Netword_card)```
For old Windows, Like Windows XP and Windows Vista, I recommend you to use rtl8139.
So command for that should be ```-net rtl8139```
For Windows 7 and More, use e1000.
Command should be ```-net e1000```
### 10. Sound
```-soundhw (sound_card)```
I recommend ac97 for Windows! So the command should be ```-soundhw ac97````
### 11. VNC server
```-vnc localhost:(number)```
Because GUI in NewTerms is not supported, so we need a display, and thats VNC.
To connect, you need a vnc server.
Lets think we had created a vnc server with ```vnc localhost:1```
#### 1.Open VNC Viewer App.
#### 2. Click on + button in the top-right corner
![IMG_0316](https://user-images.githubusercontent.com/93073424/155324328-53cfcae0-31ba-49a2-9c1c-2593f0910f33.PNG)
#### 3. It should take you to VNC configuration tab. Fill in the information.
![IMG_0317](https://user-images.githubusercontent.com/93073424/155324722-9d2bfc2b-42f5-4505-9617-1d428dd0cfe0.PNG)
Because my Windows Address is 'localhost:1', I should write 'localhost:1' in the Adress tab.
And just give it a friendly name to your pc
#### Congratulations, you fininshed the hard part.
## 4) Now let's boot our VM!
---------------
1. Open up NewTerm App.
2. copy-paste this command ```qemu-img create windows7.qcow2 30G```. This would provide you .qcow2 file to install Windows 7.
3. check your ```windows7.iso``` and ```windows7.qcow2```file's directory. ```windows7.iso```'s directory should be ```~/Documents/windows7.iso``` (Default Directory in Filza) and ```windows7.qcow```'s directory should be ```/var/mobile/windows7.qcow2``` (Default directory if you create the ```.qcow2```file)
4. Now Its time for long command line. Please rename your iso to 'windows7.iso'
command:
```qemu-system-x86_64 -cdrom ~/Document/windows7.iso -m 3096 -hda /var/mobile/windows7.qcow2 -cpu qemu64 -smp cpus=4,sockets=1,cores=4,threads=1 -machine q35,vmport=off -accel tcg,thread=multi,tb-size=1024 -net e1000 -name Windows 7 -vnc localhost:1 -soundhw ac97```
5. If it doesn't show any issues, now you may connect to pre-made VNC, Which we made in #11 of learning commands.
6. If you did everything correctly, It will boot fine.
# CONGRATS, YOU ARE NOW ABLE TO RUN NATIVE QEMU ON YOUR I-DEVICE!
