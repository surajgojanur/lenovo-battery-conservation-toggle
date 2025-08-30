#!/bin/bash

# Path to TLP config file
CONFIG_FILE="/etc/tlp.conf"

# Path to conservation_mode sysfs file
CONSERVATION_MODE_FILE="/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode"

# Define the conservation and default charge thresholds
CONSERVATION_THRESHOLD=60
DEFAULT_THRESHOLD=75

# Function to enable conservation mode
enable_conservation() {
    # Set the conservation mode to on (charge threshold 60%)
    echo 1 | sudo tee $CONSERVATION_MODE_FILE > /dev/null
    sudo sed -i "s/^START_CHARGE_THRESH_BAT0=[0-9]*$/START_CHARGE_THRESH_BAT0=$CONSERVATION_THRESHOLD/" $CONFIG_FILE
    sudo systemctl restart tlp
    echo "Battery conservation mode enabled. Charge threshold set to $CONSERVATION_THRESHOLD%."
}

# Function to disable conservation mode
disable_conservation() {
    # Set the conservation mode to off
    echo 0 | sudo tee $CONSERVATION_MODE_FILE > /dev/null
    sudo sed -i "s/^START_CHARGE_THRESH_BAT0=[0-9]*$/START_CHARGE_THRESH_BAT0=$DEFAULT_THRESHOLD/" $CONFIG_FILE
    sudo systemctl restart tlp
    echo "Battery conservation mode disabled. Charge threshold set to $DEFAULT_THRESHOLD%."
}

# Check for argument
if [ "$1" == "enable" ]; then
    enable_conservation
elif [ "$1" == "disable" ]; then
    disable_conservation
else
    echo "Usage: $0 {enable|disable}"
    exit 1
fi
