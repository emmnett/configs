#! /usr/bin/env pvpython
# binaryVTK.py
#
# Skript for converting between binary and ascii VTK files

import sys
import paraview.simple as pv

for arg in sys.argv[1:]:
    if arg.endswith("vtk"):
        print "Compressing {}".format(arg) 
        r = pv.LegacyVTKReader( FileNames=arg)
        w = pv.XMLUnstructuredGridWriter()
        w.FileName = arg.replace("vtk","vtu")
        w.DataMode='Binary' 
        w.UpdatePipeline()
    if arg.endswith("vtu"):
        print "Uncompressing {}".format(arg) 
        r = pv.XMLUnstructuredGridReader( FileName=arg )
        w = pv.XMLUnstructuredGridWriter()
        w.FileName = arg.replace("vtu","vtk")
        w.DataMode='Ascii' 
        w.UpdatePipeline()



