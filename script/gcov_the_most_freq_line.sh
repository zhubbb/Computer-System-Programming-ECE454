#!/bin/bash 


cat place.c.gcov | grep -P '\s*\d{8}:\s\d+'
