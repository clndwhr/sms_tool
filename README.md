SMS Tool for 3G/4G/5G modem
===================

* sms tool for various of 3g/4g modem
* read sms as raw pdu or decoded text
* support ucs2 decoding

Usage: sms_tool [options] [signal] [...data]
----------------

sms_tool 2025.1.2 mod by iamromulan
usage: [options] send phoneNumber message
       [options] recv
       [options] delete msg_index | all
       [options] status
       [options] ussd code
       [options] at command
options:
 -b baudrate (default: 115200)
 -c coding scheme (for ussd, 0 - 7BIT, 2 - UCS2, default: detect)
 -d tty device (default: /dev/ttyUSB0)
 -D debug (for ussd and at)
 -f date/time format (for sms/recv)
 -j json output (for sms/recv)
 -R use raw input (for ussd)
 -r use raw output (for ussd and sms/recv)
 -s preferred storage (for sms/recv/status)
 -t timeout in seconds (default: 180)
 --version (show version information)
