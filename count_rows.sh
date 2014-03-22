#!/bin/sh

table_names=(
table1
table2
table3 
)
echo ""
echo `date`| tee -a table_rows.txt

for i in "${table_names[@]}"
do
    echo "counting rows for $i ..."
    hbase org.apache.hadoop.hbase.mapreduce.RowCounter "$i" > "$i""_output.txt" 2>&1
    row=$( grep "ROWS=" "$i""_output.txt"|awk -F ' ' '{ print $5 }')
    echo "$i: $row" | tee -a table_rows.txt
    echo "done."
done
