#!/bin/bash

echo -e "o\nn\np\n1\n\n\nw" | sudo fdisk /dev/sdf
echo -e "o\nn\np\n1\n\n\nw" | sudo fdisk /dev/sdg
echo -e "o\nn\np\n1\n\n\nw" | sudo fdisk /dev/sdh


#if [ "$1" = "LVM" ]
  sudo pvcreate -f /dev/sdf1 /dev/sdg1 /dev/sdh1
  sudo vgcreate vg-benchmark /dev/sdf1 /dev/sdg1 /dev/sdh1
  sudo lvcreate -L50G -nlv-benchmark vg-benchmark
  sudo mkfs.ext4 -L p_test_volume  /dev/mapper/vg--benchmark-lv--benchmark
  sudo mount /dev/mapper/vg--benchmark-lv--benchmark /mnt/p_test_volume
#fi


