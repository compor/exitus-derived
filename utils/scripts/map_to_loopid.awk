#!/usr/bin/awk -f

# requires 2 files as arguments
# first file is a mapping between loop ID's and function names
# second file is required to have the function name as the last field
# result is a list where the loop ID is prepended to every record that has a
# function from the first file

BEGIN {
  if(ARGC != 3) {
    e=sprintf("%s: requires 2 arguments\n", ARGV[0])
    print e > "/dev/stderr"
    exit 1
  }
}

NR == FNR { func2id[$2]=$1; next; }
{ if($NF in func2id) print func2id[$NF]" "$0; }

