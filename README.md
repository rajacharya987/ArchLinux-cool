
# 🧊 ArchLinux-cool: Thermal & Performance Optimizer for KDE/Arch Systems

This Bash script applies a series of thermal and power-saving tweaks to optimize system performance on KDE-based Arch Linux setups, especially useful for laptops.

---

## 🔧 What It Does

1. **Disables KDE Baloo File Indexing**
   Stops background file indexing to save CPU and disk I/O.

2. **Sets CPU Governor to `powersave`**
   Reduces CPU frequency to conserve power when not under load.

3. **Disables Intel Turbo Boost**
   Prevents thermal spikes and high power consumption by disabling Turbo Boost.

4. **Enables TLP and Thermald**
   Automatically manages power and thermal profiles in the background.

5. **Loads the Coretemp Module**
   Ensures temperature sensors are available for logging.

6. **Logs Boot-Time Temperatures**
   Captures initial thermal state in `/var/log/boot_temp.log`.

---

## ✅ Requirements

Ensure the following packages and modules are installed:

* `tlp`
* `thermald`
* `cpupower`
* `lm_sensors`
* Kernel module: `coretemp` (usually built-in or available)

Install using:

```bash
sudo pacman -S tlp thermald cpupower lm_sensors
```

---

## 🚀 Usage

Make the script executable:

```bash
chmod +x archlinux-cool.sh
```

Run it manually:

```bash
sudo ./archlinux-cool.sh
```

Or auto-run at startup via systemd or `.bash_profile`.

---

## 💡 Notes

* The script safely handles missing commands like `balooctl`.
* It directly edits Baloo config (`~/.config/baloofilerc`) if needed.
* Logs initial temperatures for diagnostics or thermal monitoring.

---

## 🛡️ Disclaimer

Use at your own risk. Some changes (like disabling Turbo Boost) may reduce performance in high-demand tasks.

---

## 🧠 Author

Made with 💻 by [rajacharya987](https://github.com/rajacharya987)
For power users who prefer a quiet, cool, and efficient Linux experience.
