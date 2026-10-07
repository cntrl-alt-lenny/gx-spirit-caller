typedef struct {
    int w[26];
} Hdr;

typedef struct {
    short h0;
    unsigned char b2;
    unsigned char fl;
    char pad4[12];
} Slot;

typedef struct {
    Hdr hdr;
    char pad68[0xa4 - 0x68];
    Slot s[4];
    char pade4[0xea - 0xe4];
    unsigned short b0 : 1;
} Obj;

extern void Fill32(int v, void *dst, int n);

int func_0202aa58(Obj *o) {
    Hdr saved;
    int i;
    unsigned char *fp;
    saved = o->hdr;
    Fill32(0, o, 0xec);
    o->hdr = saved;
    o->b0 = 1;
    fp = (unsigned char *)o + 0xa7;
    for (i = 0; i < 4; i++) {
        o->s[i].h0 = -1;
        *fp &= ~1;
        fp += 16;
    }
    return 1;
}
