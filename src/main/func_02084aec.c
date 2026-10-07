typedef unsigned int u32;

struct Node;
struct Obj {
    u32 flags;
    int pad4;
    struct Node *f8;
    int padc;
    struct Node *f10;
    int pad14;
    struct Node *f18;
};

extern void *data_021a1b1c;
extern void Fill32(int value, void *dest, int count);
extern void func_02084bc8(void *bits, struct Node *n);
extern void func_02084c38(void *a, struct Obj *o);

void func_02084aec(struct Obj *o)
{
    char buf[0x188];
    if ((o->flags & 0x10) == 0x10) {
        Fill32(0, (char *)o + 0x3c, 8);
        Fill32(0, (char *)o + 0x44, 8);
        Fill32(0, (char *)o + 0x4c, 8);
        if (o->f8 != 0) {
            func_02084bc8((char *)o + 0x3c, o->f8);
        }
        if (o->f10 != 0) {
            func_02084bc8((char *)o + 0x44, o->f10);
        }
        if (o->f18 != 0) {
            func_02084bc8((char *)o + 0x4c, o->f18);
        }
        o->flags &= ~0x10;
    }
    if (data_021a1b1c != 0) {
        func_02084c38(data_021a1b1c, o);
        return;
    }
    data_021a1b1c = buf;
    func_02084c38(buf, o);
    data_021a1b1c = 0;
}
