#!/bin/sh -e

for i in webapplications/stafftracker webservices/{staffservice,zipcodeservice,roomservice}
do
    cd $i
    node2nix --nodejs-14 -e ../../node-env.nix
    cd ../..
done
