typedef struct {
    unsigned short w0;
    unsigned short bit0 : 1;
    unsigned short pad1 : 13;
    unsigned short bit14 : 1;
    unsigned short pad15 : 1;
} S021ff400;

extern int func_ov002_021ff1c8(S021ff400 *, int);
extern int func_ov002_021ca1d8(int);
extern int func_ov002_0223f5dc(S021ff400 *);
extern int func_ov002_02253600(int, unsigned short, int);

int func_ov002_021ff310(S021ff400 *p) {
    int xorbit;
    int callresult;
    xorbit = p->bit0 ^ p->bit14;
    if (func_ov002_021ff1c8(p, xorbit) == 0) {
        return 0;
    }
    if (func_ov002_021ca1d8(xorbit) == 0) {
        return 0;
    }
    callresult = func_ov002_0223f5dc(p);
    return func_ov002_02253600(xorbit, p->w0, callresult) != 0;
}
