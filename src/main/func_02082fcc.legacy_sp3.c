typedef unsigned char u8;
typedef struct Ctx Ctx;
struct Ctx {
    u8 *pc;
    int pad4;
    unsigned int flags;
    char padc[0x28];
    void (*cb)(Ctx *);
    char pad38[0x5e];
    u8 st;
};

extern void func_02084efc(u8 *a, int b);

void func_02082fcc(Ctx *c)
{
    int st;
    int m;
    if (c->cb != 0) {
        st = c->st;
    } else {
        st = 0;
    }
    if (st == 1) {
        c->flags &= ~0x40;
        c->cb(c);
        if (c->cb != 0) {
            st = c->st;
        } else {
            st = 0;
        }
        m = c->flags & 0x40;
    } else {
        m = 0;
    }
    if (!(c->flags & 0x100) && m == 0) {
        u8 *p = c->pc;
        func_02084efc(p + (p[1] | (p[2] << 8) | (p[3] << 16) | (p[4] << 24)),
                      p[5] | (p[6] << 8) | (p[7] << 16) | (p[8] << 24));
    }
    if (st == 3) {
        c->flags &= ~0x40;
        c->cb(c);
    }
    c->pc = c->pc + 9;
}
