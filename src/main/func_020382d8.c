typedef struct {
    char _pad[0x34];
    unsigned int id;
    char _38[0x32];
    signed char state;
    char _6b[0x9];
    unsigned short alias;
    char _76[0x2];
} ent_02037b58_t;
extern ent_02037b58_t data_0219b760[];
extern unsigned char data_0219b2e0[];
extern ent_02037b58_t *func_02037b58(int id);
extern int func_02038270(unsigned char *obj, int mode, int b, int c, int d);

int func_020382d8(int id, int mode, int b, int c, int d) {
    ent_02037b58_t *e;
    int i;
    if (!(*(unsigned short *)(data_0219b2e0 + 0x12) & 0x4000)) return 0;
    if (b < 0) b = 8;
    if (c < 0) c = 8;
    if (d < 0) d = 8;
    e = func_02037b58(id);
    if (e == 0) {
        e = data_0219b760;
        switch (id) {
        case 0x8f00000:
            for (i = 0; i < 0x1c; i++, e++) {
                if (e->state >= 0 && !(e->id & 0x1000000)) func_02038270((unsigned char *)e, mode, b, c, d);
            }
            break;
        case 0x8f00001:
            for (i = 0; i < 0x1c; i++, e++) {
                if (e->state >= 0 && (e->id & 0x3000000) == 0x1000000) func_02038270((unsigned char *)e, mode, b, c, d);
            }
            break;
        case 0x8f00002:
            for (i = 0; i < 0x1c; i++, e++) {
                if (e->state >= 0 && (e->id & 0x3000000) == 0x3000000) func_02038270((unsigned char *)e, mode, b, c, d);
            }
            break;
        case 0x8f00003:
            for (i = 0; i < 0x1c; i++, e++) {
                if (e->state >= 0 && (e->id & 0x1000000)) func_02038270((unsigned char *)e, mode, b, c, d);
            }
            break;
        case 0x8f00004:
            for (i = 0; i < 0x1c; i++, e++) {
                if (e->state >= 0) func_02038270((unsigned char *)e, mode, b, c, d);
            }
            break;
        default: return 0;
        }
        return 1;
    }
    return func_02038270((unsigned char *)e, mode, b, c, d);
}
