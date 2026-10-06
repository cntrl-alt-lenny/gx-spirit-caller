typedef struct obj_02066d44 obj_02066d44_t;

struct obj_02066d44 {
    char           _0[0xa8];
    void         (*cb)(unsigned int addr, unsigned short port, int arg);
    char           _ac[0x58];
    unsigned int   addr;
    unsigned short port;
    char           _10a[0x2];
    int            arg;
};

extern char data_02101778[];
extern void func_020aac84(int a0, int a1, ...);

static inline unsigned int Swap32_02066d44(unsigned int x) {
    return ((x >> 24) & 0xff) | ((x >> 8) & 0xff00) | ((x << 8) & 0xff0000) | ((x << 24) & 0xff000000);
}

void func_02066d44(obj_02066d44_t *o, char *s) {
    unsigned int addr;
    unsigned int port;
    unsigned short p;

    func_020aac84((int)s, (int)data_02101778, &addr, &port);
    p = port;
    addr = Swap32_02066d44(addr);
    if (addr == 0 || p == 0) {
        return;
    }
    if (o->addr == addr && o->port == p) {
        return;
    }
    o->addr = addr;
    o->port = p;
    o->cb(addr, p, o->arg);
}
