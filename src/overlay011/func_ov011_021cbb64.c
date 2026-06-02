/* func_ov011_021cbb64: configure cell handle 4140[idx] via the 0201eaa0 sink
 * (0x4000/96 config); optional retag (a1!=-1) and reset+release on fresh tag. */
#include "ov011_core.h"
extern char data_ov011_021d4140[];
extern void func_0201e800(void *h, int v);
extern void func_0201eaa0(int a, void *h, void *cfg, int d, int e, int f, int g,
                          int i, int j, int k, int l, int m);
extern void func_0201e7ec(void *h, int v);
extern void func_0207fd28(void *h, int flags);
void func_ov011_021cbb64(int idx, int a1, int a2, int a3, void *p5, int p6) {
    void *h = ((void **)data_ov011_021d4140)[idx];
    if (a1 != -1) func_0201e800(h, (unsigned int)(a1 << 16) >> 16);
    func_0201eaa0(1, h, p5, 0,  0, 0, a3, a2, 0x4000, 96, p6, 0);
    if (a1 != -1) return;
    func_0201e7ec(h, 1);
    func_0207fd28(h, 0x1000);
}
