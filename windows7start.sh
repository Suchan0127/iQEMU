qemu-system-x86_64 -cdrom ~/Document/windows7.iso -m 3096 -hda /var/mobile/windows7.qcow2 -cpu qemu64 -smp cpus=4,sockets=1,cores=4,threads=1 -machine q35,vmport=off -accel tcg,thread=multi,tb-size=1024 -net e1000 -name Windows 7 -vnc localhost:1 -soundhw ac97