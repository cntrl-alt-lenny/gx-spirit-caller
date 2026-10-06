typedef struct {
    char          _0[0x12];
    unsigned char f12;
    unsigned char f13;
} pkt_020652b8_t;

typedef struct {
    char           _0[0x2];
    unsigned short port;
    int            addr;
} hdr_020652b8_t;

typedef struct obj_020652b8 obj_020652b8_t;

struct obj_020652b8 {
    char           _0[0x4];
    int            f4;
    char           _8[0x8];
    int            state;
    char           _14[0x14];
    int            deadline;
    int            addr;
    unsigned short port;
    unsigned char  f32;
    unsigned char  f33;
    char           _34[0x4];
    void         (*cb)(int a, int b, hdr_020652b8_t *h, int arg);
    int            arg;
};

extern void func_020659ac(obj_020652b8_t *o);
extern int func_02055330(void);

void func_020652b8(obj_020652b8_t *o, pkt_020652b8_t *pk, hdr_020652b8_t *h) {
    if (o->state < 2) {
        return;
    }
    o->addr = h->addr;
    o->port = ((h->port >> 8) & 0xff) | ((h->port << 8) & 0xff00);
    o->f32 = 1;
    if (pk->f12 == 0) {
        func_020659ac(o);
        return;
    }
    if (o->state == 2) {
        if (o->f33 == 0) {
            func_020659ac(o);
        }
        o->state = 3;
        o->deadline = func_02055330() + 5000;
        if (o->f4 != -1) {
            o->cb(0, o->f4, h, o->arg);
        }
        return;
    }
    if (pk->f13 == 0) {
        func_020659ac(o);
    }
}
