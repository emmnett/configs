#! /bin/bash
set -e
# Any subsequent(*) commands which fail will cause the shell script to exit immediately

module load paraview_4.4
module load tecplot_360_2015

for run in "$@"; do

cd $run
if [ -d VTK ] ; then
cd VTK
#Remove all but first and last step
for file in *vt[ku] ; do
    [ -e "$file" ] || break
    modsteps=$(ls *vt[ku] | sed 's/.*\(_t\|_step\)0*\([1-9][0-9]*\).vt[ku]/\2/' | sort -g | uniq)
    firststep=$(echo $modsteps | head -n 1 | awk '{print $1;}')
    laststep=$(echo $modsteps | tail -n 1 | awk '{print $NF;}')
    find . -type f -not -regex  ".*/.*\(_t\|_step\)0*\(${firststep}\|${laststep}\)\.vt[ku]" -exec rm {} \; 
    break #only execute once
done

#Convert or remove all vtk files
for file in *vtk ; do
    [ -e "$file" ] || break
    if [ -e "${file%vtk}vtu" ] ; then
	rm $file
    else
        ~/bin/binaryVTK.py $file && rm $file
    fi
done
cd ..
fi

if [ -d Tecplot ] ; then
cd Tecplot
for file in *plt *dat ; do
    [ -e "$file" ] || break
    #Remove all but first and last step
    modsteps=$(ls *plt *dat | sed 's/.*\(_t\|_step\)0*\([1-9][0-9]*\).\(plt\|dat\)/\2/' | sort -g | uniq)
    firststep=$(echo $modsteps | head -n 1 | awk '{print $1;}')
    laststep=$(echo $modsteps | tail -n 1 | awk '{print $NF;}')
    find . -type f -not -regex  ".*\(_t\|_step\)0*\(${firststep}\|${laststep}\)\.\(plt\|dat\)" -exec rm {} \; 
    break #only execute once
done

#Convert or remove all Tecplot files
for file in *dat ; do
    [ -e "$file" ] || break
    if [ -e "${file%dat}plt" ] ; then
	rm $file
    else
        preplot $file && rm $file
    fi
done
cd ..
fi

rm -f OUT/*bin
rm -f TROUT/*.bin

cd ..
mv $run oldruns/

done
