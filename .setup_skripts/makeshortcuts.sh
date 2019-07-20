#!/bin/bash
# Create shortcuts in home directory on ESD servers

cd $HOME
if [ ! -d shortcuts ] ; then
    mkdir shortcuts
fi
cd shortcuts

if [ -e data ] ; then
    rm data
fi
ln -s /esd/esd01/data/mnettesheim/ data

if [ -e docs ] ; then
    rm docs
fi
ln -s /esd/esd01/docs/mnettesheim/ docs

if [ -e douarsrc ] ; then
    rm douarsrc
fi
ln -s /esd/esd01/docs/mnettesheim/src/douar-wsmp/src douarsrc

if [ -e douardocs ] ; then
    rm douardocs
fi
ln -s /esd/esd01/docs/mnettesheim/documents/DOUAR douardocs

if [ -e douarmodels ] ; then
    rm douarmodels
fi
ln -s /esd/esd01/data/mnettesheim/model_runs/DOUAR/ douarmodels
 
