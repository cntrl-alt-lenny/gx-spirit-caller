/* func_ov011_021cbaa0: configure cell handle 4140[idx] via the 0201eaa0 sink
 * (0x4000/96 config); optional retag (a1!=-1) and reset+release on fresh tag. */
#include "ov011_core.h"
extern char data_ov011_021d4060[];
extern void func_0201e7ac(void *h, int v);
extern void func_0201ea4c(int a, void *h, void *cfg, int d, int e, int f, int g,
                          int i, int j, int k, int l, int m);
extern void func_0201e798(void *h, int v);
extern void func_0207fc40(void *h, int flags);
void func_ov011_021cbaa0(int idx, int a1, int a2, int a3, void *p5, int p6) {
    void *h = ((void **)data_ov011_021d4060)[idx];
    if (a1 != -1) func_0201e7ac(h, (unsigned int)(a1 << 16) >> 16);
    func_0201ea4c(1, h, p5, 0,  0, 0, a3, a2, 0x4000, 96, p6, 0);
    if (a1 != -1) return;
    func_0201e798(h, 1);
    func_0207fc40(h, 0x1000);
}
