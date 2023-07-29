# Set time to wait API answer
OFF_SET=300
# Started time
time1=$(date +%s)
# Ending time
timeout=$(( $time1 + $OFF_SET ))

echo "--------------------------------------"
echo "Ping: $1"
echo

while [ "$api_foo" != "ok" ]
do
    api_foo=$(curl $1 | awk -F '"' '{print $4}')
    time1=$(date +%s)
    if [ "$api_foo" = "ok" ]
    then
        echo "API is available."
        exit 0
    fi

    if [ $time1 > $timeout ]
    then
        echo "API is not available."
        exit 1
    fi
done
