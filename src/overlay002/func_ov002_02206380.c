typedef struct {
    unsigned short w0;
    unsigned short bit0 : 1;
    unsigned short f1 : 5;
    unsigned short pad6 : 8;
    unsigned short bit14 : 1;
    unsigned short pad15 : 1;
} S02206380;

extern int func_ov002_021ca2b8();
extern int func_ov002_021b9e00(int, int);
extern int func_ov002_021f4194(S02206380 *);
extern int func_ov002_021bc8c8(int, int, int);
extern int func_ov002_021ff2b8(S02206380 *, int);
extern int func_ov002_021bc288(int, int);

int func_ov002_02206380(S02206380 *p) {
    int x = p->bit0 ^ p->bit14;
    int n;
    if (func_ov002_021ca2b8(x) == 0) {
        return 0;
    }
    n = func_ov002_021b9e00(p->bit0, p->f1);
    if (n < func_ov002_021f4194(p)) {
        return 0;
    }
    if (func_ov002_021bc8c8(x, p->bit0, p->f1) == 0) {
        return 0;
    }
    if (func_ov002_021ff2b8(p, x) != 0 || (x == p->bit0 && func_ov002_021bc288(p->bit0, p->f1) != 0)) {
        return 1;
    }
    return 0;
}
