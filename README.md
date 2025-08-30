# Lenovo Battery Conservation Toggle Script

Welcome to the **Lenovo Battery Conservation Toggle** script! This simple script enables you to toggle the battery conservation mode on Lenovo laptops running Linux. By enabling this mode, you can limit the battery charge to a set threshold (e.g., 60%), helping to extend the lifespan of your laptop's battery.

## Features
- **Enable or disable battery conservation mode** on Lenovo laptops.
- **Set the charge threshold** to either 60% (for conservation) or 75% (default).
- **Works with Lenovo laptops** using the `ideapad_acpi` driver on Linux.

## Requirements
- A **Lenovo laptop** running **Linux** (tested on Fedora, but should work on other distributions with `tlp` and `ideapad_acpi`).
- **`tlp`** installed to manage battery charge thresholds.
- Laptop must be using the **`ideapad_acpi`** driver (common on Lenovo laptops).

## Installation Guide

Follow these steps to set up the script on your system:

### Step 1: Clone the Repository

Start by cloning the repository to your local machine. Open a terminal and run:

```bash
git clone https://github.com/yourusername/lenovo-battery-conservation-toggle.git
cd lenovo-battery-conservation-toggle
````

### Step 2: Make the Script Executable

Next, make the script executable by running the following command:

```bash
chmod +x battery_mode.sh
```

This grants the script permission to be run from your terminal.

### Step 3: (Optional) Move the Script to a Directory in Your PATH

If you'd like to run the script globally (from anywhere on your system), move it to a directory that's included in your system's PATH. This step is optional but recommended for ease of use.

To move the script to a global location, run:

```bash
sudo mv battery_mode.sh /usr/local/bin/battery_mode
```

Now you can use the `battery_mode` command from anywhere on your system!

## How to Use the Script

### Enable Battery Conservation Mode (Charge Threshold Set to 60%)

To enable battery conservation mode, limiting the battery charge to 60%, run:

```bash
battery_mode enable
```

This will:

* Set the charge threshold to 60%.
* Activate battery conservation mode, so your laptop stops charging once it hits 60%.

### Disable Battery Conservation Mode (Charge Threshold Set to 75%)

To disable battery conservation mode and allow your laptop to charge fully (up to 100%), run:

```bash
battery_mode disable
```

This will:

* Set the charge threshold to 75% (default setting).
* Deactivate conservation mode, allowing the battery to charge beyond 60% to 100%.

### Confirm the Current Status

To check the current status of the battery conservation mode and charge threshold, run:

```bash
sudo tlp-stat -b
```

This will show if conservation mode is enabled or disabled, along with other battery details, like the current charge level and capacity.

## Troubleshooting

If the script doesn’t seem to be working, try the following:

1. **Ensure `tlp` is installed and running:**

   * For Ubuntu/Debian-based systems:

   ```bash
   sudo apt install tlp
   ```

   * For Fedora:

   ```bash
   sudo dnf install tlp
   ```

2. **Verify your system is using the `ideapad_acpi` driver** (commonly used on Lenovo laptops).

If you're still encountering issues, please open an [Issue](https://github.com/yourusername/lenovo-battery-conservation-toggle/issues) in the repository, and I'll be happy to assist.

## Contributing

We welcome contributions to improve this script or add more features! To contribute:

1. Fork the repository.
2. Make your changes (fix bugs, add new features, etc.).
3. Submit a pull request to merge your changes.

If you find any bugs or have feature requests, feel free to open an issue in the repository!
