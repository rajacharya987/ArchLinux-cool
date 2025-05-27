#!/bin/bash

# ---------------------------------------
# 1. Disable Baloo File Indexing (KDE)
# ---------------------------------------
if command -v balooctl >/dev/null 2>&1; then
    balooctl disable
fi

# Also write directly to config in case balooctl is missing
CONFIG="$HOME/.config/baloofilerc"
if ! grep -q "IndexingEnabled=false" "$CONFIG" 2>/dev/null; then
    mkdir -p "$(dirname "$CONFIG")"
    echo -e "[Basic Settings]\nIndexingEnabled=false" > "$CONFIG"
fi

# ---------------------------------------
# 2. Set CPU Governor to Powersave
# ---------------------------------------
cpupower frequency-set -g powersave

# ---------------------------------------
# 3. Disable Intel Turbo Boost
# ---------------------------------------
echo "0" | tee /sys/devices/system/cpu/intel_pstate/no_turbo

# ---------------------------------------
# 4. Enable Power + Thermal Services
# ---------------------------------------
systemctl enable --now tlp
systemctl enable --now thermald

# ---------------------------------------
# 5. Load Sensors Module
# ---------------------------------------
modprobe coretemp

# ---------------------------------------
# 6. Log Boot-Time Temperatures
# ---------------------------------------
mkdir -p /var/log
sensors > /var/log/boot_temp.log

# ---------------------------------------
# Done
# ---------------------------------------
echo "✅ Thermal & performance optimizations applied at startup."

