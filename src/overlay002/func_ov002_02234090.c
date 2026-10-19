extern int func_ov002_0223df38(void *self, int a, int *out);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_021bbf50(int arg0);
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);
extern int func_ov002_021b3ecc(int arg0, int arg1, int arg2);
extern int func_ov002_021b4120(int arg0, int arg1, int arg2);
extern void func_ov002_021d5b80(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_021e276c(void *self, int a, int b, int c);
extern char data_ov002_022cf16c[];
struct Slot { unsigned id:13; unsigned flag:1; unsigned pad:8; unsigned value:8; unsigned rest:2; char extra[16]; };
int func_ov002_02234090(unsigned short *self) {
    int out;
    if (func_ov002_0223df38(self, 0, &out)) {
        int p = out & 0xff;
        int i = ((unsigned short)out >> 8) & 0xff;
        if (func_ov002_0225764c((int)self, p, i)) {
            struct Slot *slot = (struct Slot *)(data_ov002_022cf16c + (p & 1) * 0x868 + 0x30);
            int v = slot[i].value * 2 + slot[i].flag;
            func_ov002_021d59cc(p, i, *self, 2, (unsigned short)func_ov002_021bbf50(p));
            if (func_ov002_021b3ecc(p, 11, 0x195b)) {
                if (v != func_ov002_021b4120(p, 11, 0x195b)) {
                    func_ov002_021d5b80(p, 11, *self, 1);
                    func_ov002_021e276c((void *)p, *self, 1, 0);
                }
            } else {
                func_ov002_021e276c((void *)p, *self, 1, (unsigned short)v);
            }
        }
    }
    return 0;
}
