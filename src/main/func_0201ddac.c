typedef struct {
    char pad[0x1c];
    unsigned int a : 8;
    unsigned int b : 8;
    unsigned int rest : 16;
} Obj;

int func_0201ddac(Obj *o, int x, int y) {
    int flags = 0;

    if (o->a > 0x20 && o->b > 0x20) {
        if (x >= 0x20 && y >= 0x20) {
            flags = 0x1800;
        } else if (x >= 0x20) {
            flags = 0x800;
        } else if (y >= 0x20) {
            flags = 0x1000;
        }
    } else if (o->a > 0x20) {
        if (x >= 0x20) {
            flags = 0x800;
        }
    } else if (o->b > 0x20) {
        if (y >= 0x20) {
            flags = 0x800;
        }
    }
    return flags;
}
