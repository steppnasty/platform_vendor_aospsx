mkdir -p /cache/recovery/OTA-Updater/download
updatedfile=$(find /sdcard/OTA-Updater/download/* -mtime -5)
cp $updatedfile /cache/recovery/OTA-Updater/download
reboot recovery
