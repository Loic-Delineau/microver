import struct
import time

# Replace 'eventX' with the correct event file
EVENT_FILE = "/dev/input/js0"

fmt = 'llHHI'
event_size = struct.calcsize(fmt)

with open(EVENT_FILE, "rb") as f:
    while True:
        event = f.read(event_size)
        if event:
            (tv_sec, tv_usec, type, code, value) = struct.unpack(fmt, event)
            print(f"Time: {tv_sec}.{tv_usec}, Type: {type}, Code: {code}, Value: {value}")
#        else:
#            time.sleep(0.001)

