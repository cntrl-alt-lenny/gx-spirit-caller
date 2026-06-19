/* func_ov011_021cc360: (re)configure cell handle 4120[idx] — optionally retag
 * it (a1!=-1), push a 0x2000/64 config via 0201e964, and when freshly tagged
 * (a1==-1) reset+release it. */
#include "ov011_core.h"
extern char data_ov011_021d4040[];
extern void func_0201e7ac(void *h, int v);
extern void func_0201e910(int a, int b, void *cfg, int d, int e, int f, int g,
                          int h, int i, int j, int k, int l);
extern void func_0201e798(void *h, int v);
extern void func_0207fc40(void *h, int flags);
void func_ov011_021cc360(int idx, int a1, int a2, int a3, void *p5, int p6) {
    void *h = ((void **)data_ov011_021d4040)[idx];
    if (a1 != -1) func_0201e7ac(h, (unsigned int)(a1 << 16) >> 16);
    func_0201e910(1, *(int *)((char *)h + 0x2C), p5, 0,
                  0, 0, a3, a2, 0x2000, 64, p6, 0);
    if (a1 != -1) return;
    func_0201e798(h, 1);
    func_0207fc40(h, 0x1000);
}
