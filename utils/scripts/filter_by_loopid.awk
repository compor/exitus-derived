#!/usr/bin/awk -f

# requires 2 files as arguments
# first file is a listing of loop ID's at the first field
# second file is a listing of loop ID's at the first field
# result is a list of records from the second file the have ID's in the first

BEGIN {
  if(ARGC != 3) {
    e=sprintf("%s: requires 2 arguments\n", ARGV[0])
    print e > "/dev/stderr"
    exit 1
  }
}

NR == FNR { id[$1]=1; next; }
{ if($1 in id) print; }

