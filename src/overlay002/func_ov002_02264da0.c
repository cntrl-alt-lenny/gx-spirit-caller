/* func_ov002_02264da0: gate on func_ov002_021b3ecc(self,0xb,0x18fe)==0
 * (return 1); else run a fixed sequence of 4 more calls threading the
 * first's result through, then return 0. */
extern int func_ov002_021b3ecc(void *self, int a, int b);
extern int func_ov002_021b4120(void *self, int a, int b);
extern void func_ov002_021df6d4(void *self, int a);
extern void func_ov002_021df938(void *self, int a, int b, int c);
extern void func_ov002_021d5b80(void *self, int a, int b, int c);

int func_ov002_02264da0(void *self) {
    int r4;
    if (func_ov002_021b3ecc(self, 0xb, 0x18fe) == 0) {
        return 1;
    }
    r4 = func_ov002_021b4120(self, 0xb, 0x18fe);
    func_ov002_021df6d4(self, 0x18fe);
    func_ov002_021df938(self, r4, 0, 0x18fe);
    func_ov002_021d5b80(self, 0xb, 0x18fe, 0);
    return 0;
}
