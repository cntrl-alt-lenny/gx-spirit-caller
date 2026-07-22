typedef struct {
    unsigned short w0;
    unsigned short bit0 : 1;
    unsigned short pad1 : 15;
    char pad2[16];
    int field14;
} S021faa6c;

extern int func_ov002_021b4120(int, int, unsigned short);
extern void func_ov002_021d5b80(int, int, unsigned short, int);

int func_ov002_021faa6c(S021faa6c *p) {
    p->field14 = func_ov002_021b4120(p->bit0, 11, p->w0);
    func_ov002_021d5b80(p->bit0, 11, p->w0, 0);
    return 1;
}
