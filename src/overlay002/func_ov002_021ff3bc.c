typedef struct {
    unsigned short w0;
    unsigned short bit0 : 1;
    unsigned short pad1 : 13;
    unsigned short bit14 : 1;
    unsigned short pad15 : 1;
} S021ff3bc;

extern int func_ov002_021ff2b8(S021ff3bc *, int);
extern int func_ov002_021ca2b8(int);

int func_ov002_021ff3bc(S021ff3bc *p) {
    int xorbit = p->bit0 ^ p->bit14;
    if (func_ov002_021ff2b8(p, xorbit) == 0) {
        return 0;
    }
    return func_ov002_021ca2b8(xorbit) != 0;
}
