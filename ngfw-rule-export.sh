#
# req : cygwin + xmlstarlet, xmllint, sed
#

#
# clean
#
rm -rf out
mkdir out

#
# basic convert
#
xmllint --version
xmllint --xpath //config/devices/entry/vsys/entry/rulebase/security all.xml | sed -e 's!<member>!!' -e 's!<\/member>!!'  > out/security.xml
xmllint --xpath //config/devices/entry/vsys/entry/address all.xml > out/address.xml
xmllint --xpath //config/devices/entry/vsys/entry/address-group all.xml | sed -e 's!<member>!!' -e 's!<\/member>!!'  > out/address-group.xml
xmllint --xpath //config/devices/entry/vsys/entry/service all.xml | sed -e 's!<member>!!' -e 's!<\/member>!!'  > out/service.xml
xmllint --xpath //config/devices/entry/vsys/entry/service-group all.xml | sed -e 's!<member>!!' -e 's!<\/member>!!'  > out/service-group.xml
xmllint --xpath //config/devices/entry/vsys/entry/application all.xml | sed -e 's!<member>!!' -e 's!<\/member>!!'  > out/application.xml
xmllint --xpath //config/devices/entry/vsys/entry/application-group all.xml | sed -e 's!<member>!!' -e 's!<\/member>!!'  > out/application-group.xml

#
# one more thing
#
xmlstarlet --version
xmlstarlet el out/address.xml | head -10
#xmlstarlet sel -T -t -m /address/entry -v "concat(@name,',',ip-netmask)" -n out/address.xml > out/kv.csv
xmlstarlet sel -T -t -m /address/entry -v @name -o "," -v ip-netmask -n out/address.xml > out/kv.csv
cat out/kv.csv | sed -e 's/^/s!/' -e 's/,/!/' -e 's/$/!/' > out/kv.sed
cat out/security.xml | sed -f out/kv.sed > out/security-pure.xml

#
# simply the best
#
xmlstarlet el out/security-pure.xml | head -25
xmlstarlet ed -d security/rules/entry/option/disable-server-response-inspection \
-d security/rules/entry/from \
-d security/rules/entry/to \
-d security/rules/entry/option \
-d security/rules/entry/log-start \
-d security/rules/entry/log-end \
-d security/rules/entry/category \
-d security/rules/entry/source-user \
-d security/rules/entry/hip-profiles \
out/security-pure.xml > out/security-pure-clean.xml
