uname -r | grep "[0-9][.][0-9]\{1,2\}"

expr $string : '\([a-c]*[0-9]\)'

expr $string : '[0-9][.][0-9]\{1,2\}[.][0-9]\{1,3\}'


kernelversion=$(uname -r)
echo ${kernelversion%%-*}


fullkvstring=$echo ${kernelversion%%-*}
kvnumber=

index=`echo ${kernelversion%%-*}`

uname -r | sed -n -e '[0-9][.][0-9]\{1,2\}'



kernelversion=$(uname -r)
fullkvstring=`echo ${kernelversion%%-*}`
mainkvstring=`echo ${fullkvstring%%.*}`
