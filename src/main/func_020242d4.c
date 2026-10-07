typedef struct {
    unsigned int v[4];
} Quad;

typedef struct {
    char pad0[0x68];
    short v[16];
} Obj;

extern Quad data_020be72c;

int func_020242d4(Obj *o) {
    Quad q = data_020be72c;
    int i;
    short *p = o->v;
    for (i = 0; i < 4; i++, p += 4) {
        unsigned int x = ((unsigned int)(p[0] >> 3) & 0x3ff)
                       | (((unsigned int)(p[1] >> 3) << 22) >> 12)
                       | (((unsigned int)(p[2] >> 3) << 22) >> 2)
                       | (q.v[i] << 30);
        *(unsigned int *)0x040004c8 = x;
        *(unsigned int *)0x040004cc = (unsigned short)p[3] | (q.v[i] << 30);
    }
    return 1;
}
