/* func_ov011_021cc424: (re)configure cell handle 4120[idx] — optionally retag
 * it (a1!=-1), push a 0x2000/64 config via 0201e964, and when freshly tagged
 * (a1==-1) reset+release it. */
#include "ov011_core.h"
extern char data_ov011_021d4120[];
extern void func_0201e800(void *h, int v);
extern void func_0201e964(int a, int b, void *cfg, int d, int e, int f, int g,
                          int h, int i, int j, int k, int l);
extern void func_0201e7ec(void *h, int v);
extern void func_0207fd28(void *h, int flags);
void func_ov011_021cc424(int idx, int a1, int a2, int a3, void *p5, int p6) {
    void *h = ((void **)data_ov011_021d4120)[idx];
    if (a1 != -1) func_0201e800(h, (unsigned int)(a1 << 16) >> 16);
    func_0201e964(1, *(int *)((char *)h + 0x2C), p5, 0,
                  0, 0, a3, a2, 0x2000, 64, p6, 0);
    if (a1 != -1) return;
    func_0201e7ec(h, 1);
    func_0207fd28(h, 0x1000);
}
