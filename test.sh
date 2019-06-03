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


process=`ps aux | grep v2ray | grep -v grep`
if ["$process" == "" ]; then
  echo "NOT"
else
  echo "yes"
fi

if [ -d "/etc/v2ray/"]; then
  echo "YES"
else
  echo "NOOOOO"
fi




try_files $uri $uri/ =404;

sed "s:location / {:location /${webpath}{:g" default -i

sed 's/要被替换的字符串/新的字符串/g'
$ sed 's/test/mytest/g' example-----在整行范围内把test替换为mytest。
sed 's/b7c92134-ab1b-4bc0-b3ea-93b0bbbd5873/bbbbbbbb-ab1b-4bc0-b3ea-93b0bbbd5873/g' config.json -i

read -p "please input your uuid: " uuid
sed "s/b7c92134-ab1b-4bc0-b3ea-93b0bbbd5873/${uuid}/g" config.json -i


/etc/nginx/sites-available/default


server_name _;
location / {

  wget --no-check-certificate -O v2ngwsl.sh https://raw.githubusercontent.com/uselibrary/scripts/master/v2ngwsl.sh && chmod +x v2ngwsl.sh && bash v2ngwsl.sh































sed 's/要被替换的字符串/新的字符串/g'
$ sed 's/test/mytest/g' example-----在整行范围内把test替换为mytest。
