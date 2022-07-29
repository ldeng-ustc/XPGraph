#!/bin/bash

## Graph ingest time of GraphOne-D in DRAM-only system

# GODPATH="../GraphOne/"
GODPATH="/home/zorax/XPGraph/AE_submit/god/GraphOne/"
dataset_path="/mnt/nvme1/wr/dataset/"

cur_time=$(date "+%Y-%m-%d %H:%M:%S")
echo $cur_time "Graph ingest time of GraphOne-D, with command: ${GODPATH}build/graphone32 -i ${dataset_path}Twitter/bin -v 61578415 -j 0 -s 1 -d 1 -t 16" >> god.csv
echo "make_graph_time(s),VIRT(GB),RSS(GB),vunit_size(GB),snap_size(GB),global_range_size(GB),global_range_in_size(GB),elog_size(GB),adjlist_size(GB),local_buf_size(GB)" >> god.csv
for(( times = 0; times < 3; times++))
do
    echo "times = " $times " from echo"
    sleep 10s
    ${GODPATH}build/graphone32 -i ${dataset_path}Twitter/bin -v 61578415 -j 0 -s 1 -d 1 -t 16
done
echo >> god.csv

cur_time=$(date "+%Y-%m-%d %H:%M:%S")
echo $cur_time "Graph ingest time of GraphOne-D, with command: ${GODPATH}build/graphone32 -i ${dataset_path}Friendster/all/bin -v 61578415 -j 0 -s 1 -d 1 -t 16" >> god.csv
echo "make_graph_time(s),VIRT(GB),RSS(GB),vunit_size(GB),snap_size(GB),global_range_size(GB),global_range_in_size(GB),elog_size(GB),adjlist_size(GB),local_buf_size(GB)" >> god.csv
for(( times = 0; times < 3; times++))
do
    echo "times = " $times " from echo"
    sleep 10s
    ${GODPATH}build/graphone32 -i ${dataset_path}Friendster/all/bin -v 68349467 -j 0 -s 1 -d 1 -t 16
done
echo >> god.csv

cur_time=$(date "+%Y-%m-%d %H:%M:%S")
echo $cur_time "Graph ingest time of GraphOne-D, with command: ${GODPATH}build/graphone32 -i ${dataset_path}Ukdomain/shuffle -v 61578415 -j 0 -s 1 -d 1 -t 16" >> god.csv
echo "make_graph_time(s),VIRT(GB),RSS(GB),vunit_size(GB),snap_size(GB),global_range_size(GB),global_range_in_size(GB),elog_size(GB),adjlist_size(GB),local_buf_size(GB)" >> god.csv
for(( times = 0; times < 3; times++))
do
    echo "times = " $times " from echo"
    sleep 10s
    ${GODPATH}build/graphone32 -i ${dataset_path}Ukdomain/shuffle -v 105153953 -j 0 -s 1 -d 1 -t 16
done
echo >> god.csv

cur_time=$(date "+%Y-%m-%d %H:%M:%S")
echo $cur_time "Graph ingest time of GraphOne-D, with command: ${GODPATH}build/graphone32 -i ${dataset_path}Kron28/bin -v 61578415 -j 0 -s 1 -d 1 -t 16" >> god.csv
echo "make_graph_time(s),VIRT(GB),RSS(GB),vunit_size(GB),snap_size(GB),global_range_size(GB),global_range_in_size(GB),elog_size(GB),adjlist_size(GB),local_buf_size(GB)" >> god.csv
for(( times = 0; times < 3; times++))
do
    echo "times = " $times " from echo"
    sleep 10s
    ${GODPATH}build/graphone32 -i ${dataset_path}Kron28/bin -v 268435456 -j 0 -s 1 -d 1 -t 16
done
echo >> god.csv

cur_time=$(date "+%Y-%m-%d %H:%M:%S")
echo $cur_time "Graph ingest time of GraphOne-D (DRAM Only), end." >> god.csv

mv god.csv results/fig12/GraphOne-D-DO.csv