#!/bin/sh
# name: Android Image Name Fixer 3000
# author: Arda Yigithan Orhan
# brief: Fixes the image names for you!

img_dir=$1

if [ -d $img_dir ]
then cd $img_dir 

for image in * 
do

echo "image name: " $image

#remove retina display notation
new_name=`echo ${image/@2x/}`
echo "removing retina notation: " $new_name

#replace - with _
dash_name=`echo ${new_name/-/_}`
echo "replacing dashes with underscore: " $dash_name

#TODO strip chars that android doesn't like

#lower all chars 
lc_image=`echo $dash_name | awk '{print tolower($0)}'` 
echo "lowering all chars: " $lc_image

#rename the file
mv ./$image ./$lc_image
 
done

else echo " $1 not a dir" 

fi