typedef struct {
    unsigned short w0;
    unsigned short bit0 : 1;
    unsigned short pad1 : 15;
    char pad2[16];
    int field14;
} S021faa6c;

extern int func_ov002_021b4040(int, int, unsigned short);
extern void func_ov002_021d5a90(int, int, unsigned short, int);

int func_ov002_021fa97c(S021faa6c *p) {
    p->field14 = func_ov002_021b4040(p->bit0, 11, p->w0);
    func_ov002_021d5a90(p->bit0, 11, p->w0, 0);
    return 1;
}
