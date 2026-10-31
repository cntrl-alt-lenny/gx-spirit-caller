#include "runtime/intrinsics.h"
typedef struct { int state; unsigned char pad[0x4ac]; void *socket; } Obj;
extern int func_0206950c(Obj *o, unsigned int addr, unsigned short port, void *data, int len);
int func_02069454(Obj *o, unsigned int addr, unsigned short port, unsigned int value) {
    unsigned char packet[10];

    packet[0] = 0xfd;
    packet[1] = 0xfc;
    packet[2] = 0x1e;
    packet[3] = 0x66;
    packet[4] = 0x6a;
    packet[5] = 0xb2;
    value = ((value >> 24) & 0xff) | ((value >> 8) & 0xff00) | ((value << 8) & 0xff0000) | ((value << 24) & 0xff000000);
    __memcpy(packet + 6, &value, 4);
    return func_0206950c(o, addr, port, packet, 10);
}

