extern unsigned char data_0219b760[];
extern unsigned char data_0219c408[];

typedef struct {
    char pad34[0x34];
    int w34;
    char pad6a[0x6a - 0x38];
    signed char b6a;
    char pad74[0x74 - 0x6b];
    unsigned short h74;
} Ent364c4;

int func_020364c4(unsigned int id, int (*cb)(void *, int), int arg) {
    Ent364c4 *e;
    int i;
    int found;

    found = 0;
    if (id > 0xffff) {
        if ((id & 0x8000000) == 0) {
            if (id < (unsigned int)data_0219b760 || id > (unsigned int)data_0219c408) {
                return 0;
            }
            id = ((Ent364c4 *)id)->w34;
        }
        id = (unsigned short)id;
    }

    e = (Ent364c4 *)data_0219b760;
    for (i = 0; i < 0x1c; i++) {
        if (e->b6a >= 0) {
            if ((unsigned short)e->w34 == id || e->h74 == id) {
                cb(e, arg);
                found++;
            }
        }
        e = (Ent364c4 *)((char *)e + 0x78);
    }

    return found > 0;
}
