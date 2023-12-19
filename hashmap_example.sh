#!/bin/bash

hput () { eval hash"$1"='$2' 
} 
hget () {
  eval echo '${hash'"$1"'#hash}'
}
test2=h
${test2}put France Paris
hput Netherlands Amsterdam
hput Spain Madrid
hput France Pariss
test=h
echo `${test}get France` and `hget Netherlands` and `hget Spain`
