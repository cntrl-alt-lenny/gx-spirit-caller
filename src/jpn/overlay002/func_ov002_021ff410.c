typedef struct {
    unsigned short w0;
    unsigned short bit0 : 1;
    unsigned short pad1 : 13;
    unsigned short bit14 : 1;
    unsigned short pad15 : 1;
} S021ff500;

extern int func_ov002_0223f5dc(S021ff500 *);
extern int func_ov002_02253600(int, unsigned short, int);

int func_ov002_021ff410(S021ff500 *p) {
    int xorbit = p->bit0 ^ p->bit14;
    int callresult = func_ov002_0223f5dc(p);
    return func_ov002_02253600(xorbit, p->w0, callresult) != 0;
}
