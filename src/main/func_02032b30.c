typedef struct {
    char          _pad[0xeb4];
    unsigned int  flags;
    char          _pad2[0x34];
    void        (*callback)(int b, int c, int d, int e);
} obj_02032b30_t;

extern int func_020334cc(obj_02032b30_t *o);
extern void func_020327e4(obj_02032b30_t *o);

void func_02032b30(int a, int b, int c, int d, int e, obj_02032b30_t *o) {
    int flag;

    if (func_020334cc(o) != 0) {
        return;
    }
    if (b == 0) {
        o->flags |= 0x3000;
        func_020327e4(o);
    } else {
        flag = (o->flags & 0x4000) ? 1 : 0;
        if (flag == 0) {
            if (c != 0) {
                o->flags |= 0x4000;
            } else {
                o->flags &= ~0x4000;
            }
        }
        if (c == 0) {
            if (d != 0) {
                o->flags = (o->flags | 0x1000) & ~0x2000;
            }
        } else {
            o->flags = (o->flags | 0x1000) & ~0x2000;
        }
    }
    if (o->callback != 0) {
        o->callback(b, c, d, e);
    }
}
