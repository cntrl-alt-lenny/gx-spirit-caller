typedef struct {
    unsigned short w0;
    unsigned short bit0 : 1;
    unsigned short rest : 15;
} S022961a0;

extern void func_ov002_021ba5ec(int, int);

void func_ov002_02296090(S022961a0 *p) {
    func_ov002_021ba5ec(p->bit0, p->w0);
}
