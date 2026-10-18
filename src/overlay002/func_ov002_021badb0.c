typedef struct S {
    int pad0[2];
    int f8;
    int fc;
    int f10;
    int pad14[8];
    int f34;
} S;

extern int func_0202e270(int);
extern int func_0202f9e8(int);
extern int func_ov002_021b3ecc(int, int, int);
extern int func_ov002_021bb068(int);
extern int func_ov002_021bd85c(int, int);

int func_ov002_021badb0(S *p) {
    if (func_0202e270(p->f10) != 0) {
        if (p->f34 != 0) return 0;
        if (func_ov002_021bb068(0x166c) != 0) return 0;
        if (p->f8 != 0) {
            if (func_ov002_021b3ecc(0, 0xb, 0x12bf) != 0) return 0;
        }
        if (func_0202f9e8(p->f10) == 1) {
            if (func_ov002_021bb068(0x148e) != 0) return 0;
            if (func_ov002_021bb068(0x14da) != 0) return 0;
        }
        if (func_ov002_021bd85c(p->f10, p->fc) != 0) return 0;
    }
    return 1;
}
