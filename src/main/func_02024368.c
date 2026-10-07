typedef struct {
    short v[12];
} Big;

typedef struct {
    unsigned short v[4];
} Small;

typedef struct {
    short a, b, c;
} Tri;

typedef struct {
    char pad0[0x68];
    short v[16];
} Obj;

extern Big data_020be73c;
extern Small data_020be724;
extern void func_0208c04c(short *a, short *b);

int func_02024368(Obj *o) {
    Big big = data_020be73c;
    Small small = data_020be724;
    int i;
    short *dst;
    short *src;
    short *arg;
    src = big.v;
    arg = src;
    dst = o->v;
    for (i = 0; i < 4; i++) {
        func_0208c04c(arg, src);
        *(Tri *)dst = *(Tri *)src;
        dst[3] = small.v[i];
        src += 3;
        dst += 4;
        arg += 3;
    }
    return 1;
}
