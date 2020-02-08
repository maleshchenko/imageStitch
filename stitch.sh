#!/bin/bash

convert -gravity center 1.png label:"Before" +swap -append label:" " 1.png
convert -gravity center 2.png label:"After" +swap -append label:" " 2.png
convert 1.png 2.png +append output.png
