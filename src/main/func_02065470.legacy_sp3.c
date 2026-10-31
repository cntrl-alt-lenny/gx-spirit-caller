#include "runtime/intrinsics.h"
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { int sock, other; u32 id; int value; } Context;
typedef struct { u8 zero, family; u16 port; u32 addr; } Address;
typedef struct { u8 header[6]; u8 type, command; u32 id; u8 kind, value; } Packet;
extern u8 data_02101598[6];
extern int func_02065dc0(int sock, unsigned int addr, int port, void *buf, int len);
void func_02065470(Context *p, Address *a) {
    u8 buffer[28];
    __memcpy(((Packet *)buffer)->header, data_02101598, 6);
    ((Packet *)buffer)->type = 2;
    ((Packet *)buffer)->command = 6;
    ((Packet *)buffer)->value = p->value;
    ((Packet *)buffer)->id = ((p->id >> 24) & 0xff) | ((p->id >> 8) & 0xff00) | ((p->id << 8) & 0xff0000) | ((p->id << 24) & 0xff000000);
    func_02065dc0(p->sock, a->addr, (u16)(((a->port >> 8) & 0xff) | ((a->port << 8) & 0xff00)), buffer, 0x15);
}

