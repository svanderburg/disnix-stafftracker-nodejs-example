#!/bin/sh -e

rm -f node-env.nix

for i in webapplications/stafftracker webservices/{staffservice,zipcodeservice,roomservice}
do
    cd $i
    npm2nix -e ../../node-env.nix
    cd ../..
done
