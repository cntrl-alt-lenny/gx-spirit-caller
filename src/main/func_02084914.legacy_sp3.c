typedef unsigned char u8;
typedef unsigned int u32;
struct Obj;
struct Handler {
    char pad0[0x18];
    void *arg;
    int (*test)(int *, void *, int);
    char pad20[0x2c];
    u32 bits[8];
};
struct Obj {
    u8 *pc;
    struct Handler *handler;
    u32 flags;
    char padc[8];
    void (*cb)(struct Obj *);
    char pad18[0x76];
    u8 state;
    char pad8f[0x1d];
    u8 id;
    char padad[0xb];
    int *out;
    char padbc[0xc8];
    int value;
};
void func_02084914(struct Obj *o)
{
    if (!(o->flags & 0x200)) {
        u8 id;
        u8 st;
        int busy;
        o->id = o->pc[1];
        id = o->id;
        o->flags |= 4;
        o->out = &o->value;
        if (o->cb != 0) st = o->state;
        else st = 0;
        if (st == 1) {
            o->flags &= ~0x40;
            o->cb(o);
            if (o->cb != 0) st = o->state;
            else st = 0;
            busy = o->flags & 0x40;
        } else busy = 0;
        if (busy == 0) {
            struct Handler *h = o->handler;
            if (h->arg == 0 || !(h->bits[(u32)id >> 5] & (1 << (id & 0x1f))) || !h->test(o->out, h->arg, id)) {
                *o->out = o->pc[2] & 1;
            }
        }
        if (st == 2) {
            o->flags &= ~0x40;
            o->cb(o);
            if (o->cb != 0) st = o->state;
            else st = 0;
            busy = o->flags & 0x40;
        } else busy = 0;
        if (busy == 0) {
            if (*o->out != 0) o->flags |= 1;
            else o->flags &= ~1;
        }
        if (st == 3) {
            o->flags &= ~0x40;
            o->cb(o);
        }
    }
    o->pc += 3;
}

