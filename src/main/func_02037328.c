typedef struct {
    char           _pad[0x68];
    unsigned short flags;
    signed char    state;
    char           _6b[0xd];
} ent_02037328_t;

extern ent_02037328_t data_0219b760[];

int func_02037328(ent_02037328_t *self) {
    ent_02037328_t *e = data_0219b760;
    int i;

    for (i = 0; i < 0x1c; i++, e++) {
        if (e->state < 0) {
            continue;
        }
        if (e->flags & 0x3003) {
            continue;
        }
        if (e != self) {
            return 1;
        }
    }
    return 0;
}
