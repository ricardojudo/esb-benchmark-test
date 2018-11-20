#!/bin/bash

cpupower idle-info | grep "Number of idle states:"
for i in `seq 1 $((N-1))`; do cpupower idle-set -d $i; done

sudo fio --directory=/mnt/p_test_volume --name fio_test_file --direct=1 --rw=randwrite --bs=16k --size=1G --numjobs=16 --time_based --runtime=180 --group_reporting --norandommap
sudo fio --directory=/mnt/p_test_volume --name fio_test_file --direct=1 --rw=randread --bs=16k --size=1G --numjobs=16 --time_based --runtime=180 --group_reporting --norandommap 

