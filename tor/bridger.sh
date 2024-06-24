#!/bin/bash
# https://github.com/Haj4li
# get new and fresh bridges here:
# https://bridges-test.torproject.org/options
# https://t.me/GetBridgesBot

echo -e "\nTermux tor bridge updater\n"
echo -e "\tCoded by Haj4li\n\thttps://github.com/Haj4li\n\n"

echo "Please enter your bridges. Press Ctrl+D when you're done:"
while IFS= read -r line || [[ -n $line ]]
do
    if [ -n "$line" ]; then
        input="$input$line\n"
    fi
done

# Add "Bridges" prefix to each non-empty line
prefixed_input=$(echo -e "$input" | sed '/./ s/^/Bridges /')


if [ ! -f "$PREFIX/etc/tor/torrcb" ]; then
    cp "$PREFIX/etc/tor/torrc" "$PREFIX/etc/tor/torrcb"
fi

echo "UseBridges 1" >> $PREFIX/etc/tor/torrc
echo "" >> $PREFIX/etc/tor/torrc
echo -e "$prefixed_input"  >> $PREFIX/etc/tor/torrc

echo -e "\nBridges saved to $PREFIX/etc/tor/torrc\nDone !\n"
