typedef unsigned char u8;
typedef unsigned int u32;

struct Obj {
    u8 *pc;
    int pad4;
    u32 flags;
    char pad[0xc];
    void (*cb)(struct Obj *);
    char pad1c[0x73];
    u8 state;
};

extern void func_02084e0c(int id, int *v, int n);

void func_02084840(struct Obj *o)
{
    if (!(o->flags & 0x200) && (o->flags & 1)) {
        u8 st;
        int busy;
        int v;
        if (o->cb != 0) {
            st = o->state;
        } else {
            st = 0;
        }
        if (st == 1) {
            o->flags &= ~0x40;
            o->cb(o);
            if (o->cb != 0) {
                st = o->state;
            } else {
                st = 0;
            }
            busy = o->flags & 0x40;
        } else {
            busy = 0;
        }
        if (busy == 0) {
            v = o->pc[1];
            if (!(o->flags & 0x100)) {
                func_02084e0c(0x14, &v, 1);
            }
        }
        if (st == 3) {
            o->flags &= ~0x40;
            o->cb(o);
        }
    }
    o->pc += 2;
}
