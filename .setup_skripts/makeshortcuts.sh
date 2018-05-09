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
ln -s /esd/esd01/data/mnettesheim/ data

if [ -f docs ] ; then
    rm docs
fi
ln -s /esd/esd01/docs/mnettesheim/ docs

if [ -f douarsrc ] ; then
    rm douarsrc
fi
ln -s /esd/esd01/src/mnettesheim/src/douar-wsmp/src douarsrc

if [ -f douardocs ] ; then
    rm douardocs
fi
ln -s /esd/esd01/docs/mnettesheim/documents/DOUAR douardocs

if [ -f douarmodels ] ; then
    rm douarmodels
fi
ln -s /esd/esd01/data/mnettesheim/model_runs/DOUAR/ douarmodels
 
