typedef struct {
    char           _0[0x1e];
    unsigned short f1e;
} info_0203b880_t;

typedef struct Obj {
    char             _pad_00[0x74];
    info_0203b880_t *f74;
    void            *f78;
    char             _pad_7c[0xb0 - 0x7c];
    unsigned short   fb0;
    unsigned short   fb2;
    char             _pad_b4[0xc4 - 0xb4];
} Obj;

extern Obj data_0219d388[];
extern int func_0203b830(Obj *p);

Obj *func_0203b880(void) {
    int i;
    int min = 0x10000000;
    Obj *o = data_0219d388;
    Obj *best = 0;
    int v;
    int r;

    for (i = 0; i < 8; i++, o++) {
        if (o->fb0 & 0x8000) {
            r = func_0203b830(o);
            if (o->fb0 & 0x2000) {
                v = r * 0x5b48;
            } else {
                v = r * o->fb2;
                v = v * o->f74->f1e;
            }
            if (v < min) {
                min = v;
                best = o;
            }
        }
    }
    return best;
}
