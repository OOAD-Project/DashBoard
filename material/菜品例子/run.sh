#!/bin/bash

echo "DELETE FROM \`comment\`;" > comm.sql
echo "DELETE FROM \`food\`;" >> comm.sql
echo "LOCK TABLES \`food\` WRITE;" >> comm.sql
tail -15 data | ./input.sh >> comm.sql
echo "UNLOCK TABLES;" >> comm.sql

mysql -uroot -p restaurant < ./comm.sql
