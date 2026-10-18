typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef struct {u8 a, b;} Pair;
typedef struct {
    int field0, field4;
    u32 field8;
    int fieldc, field10;
    char pad14[0x10];
    int field24, field28;
    u32 field2c;
    u16 field30;
    u8 field32, field33;
} Context;
typedef struct {
    u8 header[6];
    u8 type, command;
    u32 id, addr;
    u16 port;
    u8 flag, state;
} Packet;
extern u8 data_02101598[6];
extern void *__memcpy(void *dst, const void *src, unsigned long size);
extern int func_02065dc0(int sock, unsigned int addr, int port, void *buf, int len);
extern int func_02055330(void);

void func_020659ac(Context *p) {
    u8 buffer[20];
    int sock;
    __memcpy(buffer, data_02101598, 6);
    ((Packet *)buffer)->type = 2;
    ((Packet *)buffer)->command = 7;
    ((Packet *)buffer)->id = ((p->field8 >> 24) & 0xff) | ((p->field8 >> 8) & 0xff00) | ((p->field8 << 8) & 0xff0000) | ((p->field8 << 24) & 0xff000000);
    ((Packet *)buffer)->addr = p->field2c;
    ((Packet *)buffer)->port = ((p->field30 >> 8) & 0xff) | ((p->field30 << 8) & 0xff00);
    ((Packet *)buffer)->flag = p->field32;
    ((Packet *)buffer)->state = p->field10 == 2 ? 0 : 1;
    sock = p->field4;
    if (sock == -1) sock = p->field0;
    func_02065dc0(sock, p->field2c, p->field30, buffer, 0x14);
    p->field28 = func_02055330() + 0x2bc;
    p->field24 = 0xc;
    if (p->field32 != 0) p->field33 = 1;
}














