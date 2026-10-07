typedef struct {
    short h0;
    unsigned char b2;
    unsigned char fl;
    char pad4[6];
    unsigned short ha;
    char padc[4];
} Slot;

typedef struct {
    char pad0[0xa4];
    Slot s[4];
    char pade4[6];
    unsigned short hea;
} Obj;

extern void func_02022580(int idx);

int func_0202ab04(Obj *o) {
    int i;
    unsigned char *fp = (unsigned char *)o + 0xa7;
    for (i = 0; i < 4; i++, fp += 16) {
        if (o->s[i].h0 >= 0) {
            func_02022580(o->s[i].h0);
            o->s[i].h0 = -1;
            *fp &= ~1;
        }
    }
    o->hea &= ~1;
    return 1;
}
