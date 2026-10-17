typedef unsigned char u8;
typedef struct Ctx Ctx;
struct Ctx {
    u8 *pc;
    int pad4;
    unsigned int flags;
    char padc[0x14];
    void (*cb)(Ctx *);
    char pad24[0x6d];
    u8 st;
};
typedef struct Arg { char pad[8]; int off; int len; } Arg;

extern void func_02084efc(char *a, int b);

void func_0208428c(Ctx *c, int unused, Arg *a)
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
    if (m == 0) {
        if (!(c->flags & 0x100)) {
            func_02084efc((char *)a + a->off, a->len);
        }
    }
    if (st == 2) {
        c->flags &= ~0x40;
        c->cb(c);
        if (c->cb != 0) {
            st = c->st;
        } else {
            st = 0;
        }
    }
    if (st == 3) {
        c->flags &= ~0x40;
        c->cb(c);
    }
}
