#!bin/bash
touch tof{1..9} # touch from tof1 to tof9
touch tofn{1,3,5} # touch tofn1 ...
ls tof[2,4] # ls tof2 and tof4
ls rm -f tof* # rm all 
