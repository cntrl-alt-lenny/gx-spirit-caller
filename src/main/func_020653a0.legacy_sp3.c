typedef struct {
    char           _0[0xc];
    int            addr;
    unsigned short port;
    char           _12;
    unsigned char  result;
} pkt_020653a0_t;

typedef struct obj_020653a0 obj_020653a0_t;

struct obj_020653a0 {
    char           _0[0x8];
    int            f8;
    char           _c[0x4];
    int            state;
    char           _14[0xc];
    int            f20;
    char           _24[0x8];
    int            addr;
    unsigned short port;
    char           _32[0x2];
    void         (*on_state)(int state, int arg);
    void         (*on_result)(int r, int a, int b, int arg);
    int            arg;
};

extern void func_02065470(obj_020653a0_t *o, int x);
extern void func_02065788(int a);
extern void func_020659ac(obj_020653a0_t *o);

void func_020653a0(obj_020653a0_t *o, pkt_020653a0_t *pk, int x) {
    int r;

    if (pk->result == 0) {
        func_02065470(o, x);
    }
    if (o->state >= 2) {
        return;
    }
    if (pk->result != 0) {
        r = 3;
        if (pk->result == 1) {
            r = 1;
        } else if (pk->result == 2) {
            r = 2;
        }
        o->on_result(r, -1, 0, o->arg);
        func_02065788(o->f8);
        return;
    }
    o->addr = pk->addr;
    o->port = ((pk->port >> 8) & 0xff) | ((pk->port << 8) & 0xff00);
    o->f20 = 0;
    o->state = 2;
    o->on_state(o->state, o->arg);
    func_020659ac(o);
}
