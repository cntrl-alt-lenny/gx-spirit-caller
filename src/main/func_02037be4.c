typedef struct {
    char           _pad[0x68];
    unsigned short flags;
    char           _6a[0x6];
    unsigned char  mode;
} ent_02037be4_t;

extern ent_02037be4_t *func_02037b58(int id);

int func_02037be4(int id) {
    ent_02037be4_t *e = func_02037b58(id);
    unsigned short flags;
    int r;

    if (e == 0) {
        return 0;
    }
    flags = e->flags;
    if ((flags & 0x1) && !(flags & 0x400)) {
        return e->mode == 3 ? 0x40 : 0x20;
    }
    if (flags & 0x2000) {
        return 4;
    }
    if (flags & 0x4000) {
        return 8;
    }
    if (flags & 0x800) {
        return 1;
    }
    r = 3;
    if (flags & 0x400) {
        r |= 0x10;
    }
    return r;
}
