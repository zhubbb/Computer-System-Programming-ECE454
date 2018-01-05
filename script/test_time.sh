#!/bin/bash
make clean
make -j8
/usr/bin/time -f Elapse:%e' User':%U vpr iir1.map4.latren.net k4-n10.xml place.out route.out -nodisp -place_only -seed 0

