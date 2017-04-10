#!/usr/bin/env bash
set -e

cd /resume
python resume.py tex < /data/$1 | pandoc --template ./pandoc-templates/default.latex -H header.tex -o /data/$1.pdf

