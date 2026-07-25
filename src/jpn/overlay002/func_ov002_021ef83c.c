typedef struct {
    char pad0[2];
    unsigned short bit0 : 1;
    unsigned short pad1 : 15;
} S021ef92c;

extern int func_ov002_021bc7e8(int);
extern int func_ov002_021c1d64(S021ef92c *, int, int);
extern int func_ov002_021bc538(int);
extern int func_ov002_021bc1a8(int, int);

int func_ov002_021ef83c(S021ef92c *p, int arg1, int arg2) {
    if (func_ov002_021bc7e8(p->bit0) == 0) {
        return 0;
    }
    if (func_ov002_021c1d64(p, arg1, arg2) != 0) {
        return 0;
    }
    if (func_ov002_021bc538(p->bit0) == 0) {
        if (p->bit0 != arg1) {
            return 0;
        }
        if (func_ov002_021bc1a8(arg1, arg2) == 0) {
            return 0;
        }
    }
    return 1;
}
