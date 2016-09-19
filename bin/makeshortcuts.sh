#!/bin/bash
# Create shortcuts in home directory on ESD servers

cd $HOME
if [ ! -d shortcuts ] ; then
    mkdir shortcuts
fi
cd shortcuts

if [ -f data ] ; then
    rm data
fi
ln -s /esd/esd/data/mnettesheim/ data

if [ -f docs ] ; then
    rm docs
fi
ln -s /esd/esd/docs/mnettesheim/ docs

if [ -f douarsrc ] ; then
    rm douarsrc
fi
ln -s /esd/esd/src/mnettesheim/src/douar-wsmp/src douarsrc

if [ -f douardocs ] ; then
    rm douardocs
fi
ln -s /esd/esd/docs/mnettesheim/documents/DOUAR douardocs

if [ -f douardata ] ; then
    rm douardata
fi
ln -s /esd/esd/docs/mnettesheim/data_small/DOUAR douardata

if [ -f douarmodels ] ; then
    rm douarmodels
fi
ln -s /esd/esd/data/mnettesheim/model_runs/DOUAR/ douarmodels
 
if [ -f douarvtk ] ; then
    rm douarvtk
fi
ln -s /esd/esd/data/mnettesheim/data_large/DOUAR/VTK douarvtk
