/* func_ov002_02264cb8: gate on func_ov002_021b3dec(self,0xb,0x18fe)==0
 * (return 1); else run a fixed sequence of 4 more calls threading the
 * first's result through, then return 0. */
extern int func_ov002_021b3dec(void *self, int a, int b);
extern int func_ov002_021b4040(void *self, int a, int b);
extern void func_ov002_021df5e4(void *self, int a);
extern void func_ov002_021df848(void *self, int a, int b, int c);
extern void func_ov002_021d5a90(void *self, int a, int b, int c);

int func_ov002_02264cb8(void *self) {
    int r4;
    if (func_ov002_021b3dec(self, 0xb, 0x18fe) == 0) {
        return 1;
    }
    r4 = func_ov002_021b4040(self, 0xb, 0x18fe);
    func_ov002_021df5e4(self, 0x18fe);
    func_ov002_021df848(self, r4, 0, 0x18fe);
    func_ov002_021d5a90(self, 0xb, 0x18fe, 0);
    return 0;
}
