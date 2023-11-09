#!/bin/bash
uncrustify -c utilities/format/format.cfg --no-backup impl/*.c
uncrustify -c utilities/format/format.cfg --no-backup impl/*.h
uncrustify -c utilities/format/format.cfg --no-backup example/*.c
uncrustify -c utilities/format/format.cfg --no-backup example/*.h