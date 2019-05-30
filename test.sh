uname -r | grep "[0-9][.][0-9]\{1,2\}"

expr $string : '\([a-c]*[0-9]\)'

expr $string : '[0-9][.][0-9]\{1,2\}[.][0-9]\{1,3\}'


kernelversion=$(uname -r)
echo ${kernelversion%%-*}


fullkvstring=$echo ${kernelversion%%-*}
kvnumber=

index=`echo ${kernelversion%%-*}`

uname -r | sed -n -e '[0-9][.][0-9]\{1,2\}'


bbrkernel=4.9
kernelversion=$(uname -r)
fullkvstring=`echo ${kernelversion%%-*}`
echo $fullkvstring
mainkvstring=`echo ${fullkvstring%.*}`
echo $mainkvstring"

sum = $bbrkernel-$mainkvstring
if [ $mainkvstring -lt $bbrkernel ]; then
  echo "upgrade kernel"
else
  echo "set up bbr"
fi

a=1.0
b=1.1


bbrkernel=4.9
kernelversion=$(uname -r)
fullkvstring=`echo ${kernelversion%%-*}`
echo $fullkvstring
mainkvstring=`echo ${fullkvstring%.*}`
echo $mainkvstring"
if [ $(echo "$mainkvstring" > $bbrkernel"|bc) -eq 0 ];then
echo "$a < $b"
else
echo "$a > $b"
fi


a=1.0
b=1.1


bbrkernel=4.89
kernelversion=$(uname -r)
fullkvstring=`echo ${kernelversion%%-*}`
echo $fullkvstring
mainkvstring=`echo ${fullkvstring%.*}`
echo $mainkvstring

if [ `echo "$mainkvstring > $bbrkernel"|bc` -eq 0 ]; then
echo "$mainkvstring < $bbrkernel"
else
echo "$mainkvstring > $bbrkernel"
fi
