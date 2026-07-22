typedef struct {
    char pad0[2];
    unsigned short bit0 : 1;
    unsigned short pad1 : 15;
} S021ef92c;

extern int func_ov002_021bc8c8(int);
extern int func_ov002_021c1e44(S021ef92c *, int, int);
extern int func_ov002_021bc618(int);
extern int func_ov002_021bc288(int, int);

int func_ov002_021ef92c(S021ef92c *p, int arg1, int arg2) {
    if (func_ov002_021bc8c8(p->bit0) == 0) {
        return 0;
    }
    if (func_ov002_021c1e44(p, arg1, arg2) != 0) {
        return 0;
    }
    if (func_ov002_021bc618(p->bit0) == 0) {
        if (p->bit0 != arg1) {
            return 0;
        }
        if (func_ov002_021bc288(arg1, arg2) == 0) {
            return 0;
        }
    }
    return 1;
}
