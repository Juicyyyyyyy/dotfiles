#!/bin/bash

# Script to help users use the preseed file for Debian installation

# Define colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Debian Preseed Setup for Dotfiles ===${NC}"
echo -e "${YELLOW}This script will help you use the preseed file for automated Debian installation.${NC}"
echo

# Check if preseed.cfg exists
if [ ! -f "$(dirname "$0")/preseed.cfg" ]; then
    echo -e "${RED}Error: preseed.cfg not found in the same directory as this script.${NC}"
    exit 1
fi

# Create a temporary directory for the preseed file
TEMP_DIR=$(mktemp -d)
cp "$(dirname "$0")/preseed.cfg" "$TEMP_DIR/preseed.cfg"

echo -e "${GREEN}Preseed file copied to: $TEMP_DIR/preseed.cfg${NC}"
echo

# Instructions for using the preseed file
echo -e "${YELLOW}=== How to use the preseed file ===${NC}"
echo -e "${BLUE}Option 1: Use with a Debian ISO${NC}"
echo "1. Download a Debian netinst ISO from https://www.debian.org/download"
echo "2. When booting from the ISO, at the boot menu, press Tab to edit boot options"
echo "3. Add the following to the boot options:"
echo -e "${GREEN}   auto url=http://YOUR_SERVER_IP/preseed.cfg${NC}"
echo "   (You'll need to host the preseed file on a web server accessible during installation)"
echo
echo -e "${BLUE}Option 2: Use with a USB drive${NC}"
echo "1. Copy the preseed file to your USB drive"
echo "2. When booting from the Debian installer, at the boot menu, press Tab to edit boot options"
echo "3. Add the following to the boot options:"
echo -e "${GREEN}   auto file=/cdrom/preseed.cfg${NC}"
echo "   (Assuming the USB is mounted as /cdrom during installation)"
echo
echo -e "${BLUE}Option 3: Create a custom Debian ISO with the preseed file${NC}"
echo "1. Install the required tools:"
echo -e "${GREEN}   sudo apt-get install xorriso isolinux${NC}"
echo "2. Download a Debian netinst ISO"
echo "3. Extract the ISO contents:"
echo -e "${GREEN}   mkdir -p iso_extract/cd iso_new${NC}"
echo -e "${GREEN}   sudo mount -o loop debian.iso iso_extract/cd${NC}"
echo -e "${GREEN}   cp -rT iso_extract/cd iso_new${NC}"
echo "4. Copy the preseed file to the ISO directory:"
echo -e "${GREEN}   cp $TEMP_DIR/preseed.cfg iso_new/preseed.cfg${NC}"
echo "5. Modify the isolinux configuration to use the preseed file automatically:"
echo -e "${GREEN}   sed -i 's/timeout 0/timeout 1/' iso_new/isolinux/isolinux.cfg${NC}"
echo -e "${GREEN}   sed -i 's/default installgui/default install/' iso_new/isolinux/isolinux.cfg${NC}"
echo -e "${GREEN}   echo 'label install' >> iso_new/isolinux/txt.cfg${NC}"
echo -e "${GREEN}   echo '  menu label ^Install with preseed' >> iso_new/isolinux/txt.cfg${NC}"
echo -e "${GREEN}   echo '  kernel /install.amd/vmlinuz' >> iso_new/isolinux/txt.cfg${NC}"
echo -e "${GREEN}   echo '  append file=/cdrom/preseed.cfg vga=788 initrd=/install.amd/initrd.gz quiet ---' >> iso_new/isolinux/txt.cfg${NC}"
echo "6. Create the new ISO:"
echo -e "${GREEN}   cd iso_new${NC}"
echo -e "${GREEN}   sudo xorriso -as mkisofs -o ../debian-preseed.iso -isohybrid-mbr /usr/lib/ISOLINUX/isohdpfx.bin -c isolinux/boot.cat -b isolinux/isolinux.bin -no-emul-boot -boot-load-size 4 -boot-info-table -eltorito-alt-boot -e boot/grub/efi.img -no-emul-boot -isohybrid-gpt-basdat .${NC}"
echo "7. Your custom ISO will be created as debian-preseed.iso"
echo

echo -e "${YELLOW}=== Notes ===${NC}"
echo "- The preseed file creates a user 'user' with password 'password'. Change these in the preseed file for security."
echo "- After installation, the dotfiles will be automatically set up on first boot."
echo "- You may need to modify the preseed file to match your specific requirements (locale, timezone, etc.)."
echo
echo -e "${GREEN}The preseed file is ready for use at: $TEMP_DIR/preseed.cfg${NC}"