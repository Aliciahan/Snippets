#!/bin/bash
tar -zcvf UltiSnips.tar.gz ./ &&\
git add UltiSnips.tar.gz &&\
git commit -m "update UltiSnips.tar.gz Date: $(date)"  &&\
git push
