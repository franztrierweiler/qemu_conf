# qemu_conf

Windows 10:

* Boot sur CD-ROM gentoo install-x86-minimal-20210412T214503Z.is
* Volume hda en format qcow2 créé par qemu-img
>qemu-img create -f qcow2 gentoo.qcow2 1G

>qemu-system-x86_64 -m 1024 -hda gentoo.qcow2 -boot d -cdrom install-x86-minimal-20210412T214503Z.iso
