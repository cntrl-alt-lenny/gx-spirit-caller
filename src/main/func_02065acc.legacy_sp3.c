#include "runtime/intrinsics.h"
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { int sock, other; u32 id; int fc, f10, f14, f18, f1c, f20, f24, f28; } Context;
typedef struct { u8 header[6]; u8 type, command; u32 id; u8 kind, value, flag; u8 addr[4]; u8 port[2]; char name[64]; } Packet;
extern u8 data_02101598[6];
extern char data_0219e434[];
extern u32 data_0219e964, data_0219e960;
extern int func_02055330(void);
extern int func_02065d18(int a);
extern u32 func_02065d4c(void);
extern int func_02065dc0(int sock, unsigned int addr, int port, void *buf, int len);
extern int func_020aaddc(const char *s);
extern char *func_020aadf8(char *dst, const char *src);
void func_02065acc(Context *p) {
    u8 buffer[88];
    int len, sock;
    u32 addr, a, c, d, e;
    u16 port;
    Packet *b = (Packet *)buffer;
    __memcpy(b->header, data_02101598, 6);
    b->type = 2;
    b->command = 0;
    b->value = p->fc;
    b->id = ((p->id >> 24) & 0xff) | ((p->id >> 8) & 0xff00) | ((p->id << 8) & 0xff0000) | ((p->id << 24) & 0xff000000);
    b->flag = p->other != -1;
    a = func_02065d4c();
    c = func_02065d4c();
    d = func_02065d4c();
    e = func_02065d4c();
    addr = ((d >> 24) & 0xff) | ((e >> 8) & 0xff00) | ((c << 8) & 0xff0000) | ((a << 24) & 0xff000000);
    buffer[15] = addr >> 24;
    buffer[16] = addr >> 16;
    buffer[17] = addr >> 8;
    buffer[18] = addr;
    buffer[19] = 0;
    buffer[20] = 0;
    func_020aadf8((char *)&buffer[21], data_0219e434);
    len = func_020aaddc(data_0219e434) + 22;
    if (b->flag && p->f14 == 0) {
        b->kind = 0;
        func_02065dc0(p->other, data_0219e964, 0x6cfd, b, len);
    }
    if (p->f18 == 0) {
        b->kind = 1;
        func_02065dc0(p->sock, data_0219e964, 0x6cfd, b, len);
    }
    sock = b->flag ? p->other : p->sock;
    port = ((func_02065d18(b->flag ? p->other : p->sock) >> 8) & 0xff) | ((func_02065d18(sock) << 8) & 0xff00);
    buffer[19] = port >> 8;
    buffer[20] = port;
    if (p->f1c == 0) {
        b->kind = 2;
        func_02065dc0(p->sock, data_0219e960, 0x6cfd, b, len);
    }
    p->f28 = func_02055330() + 0x1f4;
    p->f24 = 0x1e;
}



