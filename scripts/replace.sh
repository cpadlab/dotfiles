#!/bin/bash
function settarget(){
    ip_address=$1
    machine_name=$2
    echo "$ip_address $machine_name" > .config/bin/target
}