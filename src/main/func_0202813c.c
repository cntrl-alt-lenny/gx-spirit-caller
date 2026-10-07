typedef struct {
    char pad0[0x74];
    unsigned int w74;
    char pad78[0x84 - 0x78];
    unsigned int w84;
    char pad88[0xa4 - 0x88];
    int wa4;
    char pada8[0xd4 - 0xa8];
    short hd4;
    char padd6[0xde - 0xd6];
    unsigned short b0 : 1;
    unsigned short b1 : 1;
    unsigned short b2 : 1;
} Obj;

extern void func_02092904(int a, int c);
extern void func_0208f5ac(void);
extern void func_0208f52c(int a, int b, int c);
extern void func_0208f4c8(void);
extern void func_0208ffec(int a, int b, int c);
extern void func_0208f368(void);
extern void func_0208f2f4(int a, int b, int c);
extern void func_0208f2a8(void);
extern void func_0208ff84(int a, int b, int c);

int func_0202813c(Obj *o, int a, int b, int c) {
    int r4;
    if (o->b2) {
        r4 = o->w84 & 1;
        if (r4) {
            b += ((int)(o->wa4 << 15) >> 29) << 13;
        }
    } else {
        r4 = o->w74 & 1;
    }
    func_02092904(a, c);
    switch (o->hd4) {
    case 0:
    case 1:
    case 2:
    case 3:
        if (r4) {
            func_0208f5ac();
            func_0208f52c(a, b, c);
            func_0208f4c8();
        } else {
            func_0208ffec(a, b, c);
        }
        break;
    case 4:
    case 5:
    case 6:
    case 7:
        if (r4) {
            func_0208f368();
            func_0208f2f4(a, b, c);
            func_0208f2a8();
        } else {
            func_0208ff84(a, b, c);
        }
        break;
    }
    return 1;
}
