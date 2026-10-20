typedef struct {
    int f0;
    unsigned short f4, f6, f8;
    unsigned char bytes[6];
    unsigned short mode, len;
    unsigned char data[32];
    unsigned short extra;
} Msg;
typedef struct {
    unsigned short type, f2;
    int f4;
    unsigned short f8, fa;
    unsigned char bytes[6];
    unsigned short mode, len;
    unsigned char data[32];
    unsigned short extra;
} Packet;
extern int func_0209db88(int count, ...);
extern int func_0209dcb8(int a0, int a1);
extern void func_0209de5c(int idx, int b);
extern void func_02094688(const void *src, void *dst, unsigned int len);
int func_0209eb48(int a0, Msg *msg) {
    Packet pkt;
    int rc = func_0209db88(3, 2, 3, 5);
    if (rc != 0) return rc;
    if (msg == 0) return 6;
    if (msg->f0 == 0) return 6;
    if (msg->f4 > 0x400) return 6;
    if (msg->len > 0x20) return 6;
    if (msg->mode != 0 && msg->mode != 1 && msg->mode != 2 && msg->mode != 3) return 6;
    if ((unsigned short)(msg->mode + 0xfffe) <= 1) {
        if (msg->extra > 0x20) return 6;
    }
    func_0209de5c(0x26, a0);
    pkt.type = 0x26;
    pkt.f2 = msg->f6;
    pkt.f4 = msg->f0;
    pkt.f8 = msg->f4;
    pkt.fa = msg->f8;
    func_02094688(msg->bytes, pkt.bytes, 6);
    pkt.mode = msg->mode;
    pkt.extra = msg->extra;
    pkt.len = msg->len;
    func_02094688(msg->data, pkt.data, 0x20);
    rc = func_0209dcb8((int)&pkt, 0x3c);
    if (rc == 0) rc = 2;
    return rc;
}


