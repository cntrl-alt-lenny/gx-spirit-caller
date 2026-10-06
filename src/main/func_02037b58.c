typedef struct {
    char           _pad[0x34];
    unsigned int   id;
    char           _38[0x32];
    signed char    state;
    char           _6b[0x9];
    unsigned short alias;
    char           _76[0x2];
} ent_02037b58_t;

extern ent_02037b58_t data_0219b760[];
extern unsigned char data_0219c408[];

ent_02037b58_t *func_02037b58(int id) {
    ent_02037b58_t *e = data_0219b760;
    int i;
    unsigned short key;

    if ((unsigned int)id > 0xffff && !(id & 0x8000000)) {
        if ((unsigned int)id < (unsigned int)data_0219b760 || (unsigned int)id > (unsigned int)data_0219c408) {
            return 0;
        }
        return (ent_02037b58_t *)id;
    }
    key = id;
    for (i = 0; i < 0x1c; i++, e++) {
        if (e->state >= 0) {
            if ((unsigned short)e->id == key || e->alias == key) {
                return e;
            }
        }
    }
    return 0;
}
