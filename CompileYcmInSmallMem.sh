#!/bin/bash

sudo dd if=/dev/zero of=/var/swapfile bs=1M count=2048 &&
sudo chmod 600 /var/swapfile &&
sudo mkswap /var/swapfile &&
echo /var/swapfile none swap defaults 0 0 | sudo tee -a /etc/fstab &&
sudo swapon -a
