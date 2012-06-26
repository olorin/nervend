nervend
=======

nervend is a Linux decryption daemon for the Emotiv EPOC, 
based on Kyle Machulis' emokit (https://github.com/qdot/emokit). 

requirements
============

The emokit C library (https://github.com/qdot/emokit) needs to be 
installed.

how to use it
=============

	make
	sudo ./nervend <device_type>

device_type is 'consumer' if you have the consumer model headset
and 'developer' if you have the research model. 

If all goes well it will start writing data to a named pipe at 
/dev/nervend at approximately 4096 bytes/second. You can either
parse it yourself or run it with emokit's Python library.

If all does not go well check /var/log/daemon.log for clues. If all 
continues to not go well, shoot me an email.

You can configure udev to run nervend whenever the EPOC USB dongle
is inserted; put something like this into /etc/udev/rules.d/epoc.rules:

   ATTR{manufacturer}=="Emotiv Systems Pty Ltd", ATTRS{product}=="Receiver Dongle L01", NAME="eeg/epoc%2", SYMLINK+="epoc%n"

   SUBSYSTEM=="hidraw", ATTRS{idVendor}=="21a1", ATTRS{idProduct}=="0001", NAME="eeg/encrypted%n", SYMLINK+="eeg/encrypted", MODE="0444", RUN +="/path/to/nervend device_type"
