typedef struct {
    char pad[0x40];
    char b40;
    char b41;
    char b42;
    char b43;
    char pad2[0x14];
} Entry_0200c79c;

typedef struct {
    Entry_0200c79c *entries;
    char pad[0x78];
    unsigned int rest : 31;
    unsigned int active : 1;
} Obj_0200c79c;

int func_0200c79c(Obj_0200c79c *o, int idx, unsigned int flags) {
    Entry_0200c79c *e;

    if (idx < 0) {
        o->active = 0;
    } else {
        e = o->entries + idx;
        if (e == 0) {
            return 0;
        }
        e->b40 = (flags & 1) != 0;
        e->b41 = (flags & 2) != 0;
        e->b42 = (flags & 4) != 0;
        e->b43 = (flags & 8) != 0;
        o->active = 1;
    }
    return 1;
}
