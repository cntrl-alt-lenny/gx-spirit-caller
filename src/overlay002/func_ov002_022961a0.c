typedef struct {
    unsigned short w0;
    unsigned short bit0 : 1;
    unsigned short rest : 15;
} S022961a0;

extern void func_ov002_021ba6cc(int, int);

void func_ov002_022961a0(S022961a0 *p) {
    func_ov002_021ba6cc(p->bit0, p->w0);
}
