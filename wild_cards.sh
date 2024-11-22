#!bin/bash
touch tof{1..9}.tst # touch from tof1.tst to tof9.tst
touch tofn{1,3,5}.tst # touch tofn1.tst ...
ls tof[2,4].tst # ls tof2.tst and tof4.tst
ls tofn[1-5].tst
ls t*.tst
