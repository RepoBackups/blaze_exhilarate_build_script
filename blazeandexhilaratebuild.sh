#!/bin/bash
echo "javelinanddart's Build Script for t769 and exhilarate"
echo "Cleaning up old files..."
make clobber
echo "Done"
echo "Setting up build environment..."
source build/envsetup.sh
echo "Done"
echo "Brunching for t769..."
echo "**************************************************************" >> CompileLog
echo "***********************START BUILD****************************" >> CompileLog
date >> CompileLog
time brunch t769 userdebug >> CompileLog
echo "Done"
echo "Building Recovery..."
make -j3 recoveryimage >> CompileLog
echo "Done"
echo "Brunching for exhilarate..."
time brunch exhilarate userdebug
echo "Done"
echo "Building Recovery..."
make -j3 recoveryimage
echo "Done"
echo "Copying files to Dennis's Copy"
cp -rf /home/javelinanddart/out/target/product/t769 /home/dennis/Copy/paul/
cp /home/javelinanddart/out/target/product/t769/recovery.img ../twrp_installer_blaze/recovery.img
cd ../twrp_installer_blaze
git commit -asm "Update Recovery"
git push
./zipandtar.sh
cp recovery.zip /home/dennis/Copy/paul/t769/recovery.zip
cp recovery.tar /home/dennis/Copy/paul/t769/recovery.tar
cp -rf /home/javelinanddart/out/target/product/exhilarate /home/dennis/Copy/paul/
cp /home/javelinanddart/out/target/product/exhilarate/recovery.img ../twrp_installer_exhilarate/recovery.img
cd ../twrp_installer_exhilarate
git commit -asm "Update Recovery"
git push
./zipandtar.sh
cp recovery.zip /home/dennis/Copy/paul/exhilarate/recovery.zip
cp recovery.tar /home/dennis/Copy/paul/exhilarate/recovery.tar
echo "Done"
date >> CompileLog
echo "*************************END BUILD****************************" >> CompileLog
echo "**************************************************************" >> CompileLog
exit
