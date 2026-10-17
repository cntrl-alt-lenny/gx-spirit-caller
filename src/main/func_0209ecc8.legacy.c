typedef struct {
    int f0;
    unsigned short f4;
    unsigned short f6;
    unsigned char b[6];
} Msg;

typedef struct {
    unsigned short type;
    unsigned short f2;
    int f4;
    unsigned short f8;
    unsigned char b[6];
} Packet;

extern int func_0209db88(int count, ...);
extern int func_0209dcb8(Packet *pkt, int size);
extern void func_0209de5c(int a, int b);

int func_0209ecc8(int a0, Msg *msg) {
    Packet pkt;
    int rc;
    rc = func_0209db88(3, 2, 3, 5);
    if (rc != 0) {
        return rc;
    }
    if (msg == 0) {
        return 6;
    }
    if (msg->f0 == 0) {
        return 6;
    }
    if (msg->f4 < 1 || msg->f4 > 14) {
        return 6;
    }
    func_0209de5c(10, a0);
    pkt.type = 10;
    pkt.f2 = msg->f4;
    pkt.f4 = msg->f0;
    pkt.f8 = msg->f6;
    pkt.b[0] = msg->b[0];
    pkt.b[1] = msg->b[1];
    pkt.b[2] = msg->b[2];
    pkt.b[3] = msg->b[3];
    pkt.b[4] = msg->b[4];
    pkt.b[5] = msg->b[5];
    rc = func_0209dcb8(&pkt, 16);
    if (rc == 0) {
        rc = 2;
    }
    return rc;
}
