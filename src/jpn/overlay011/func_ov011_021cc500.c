/* func_ov011_021cc500: sibling of 021cc424 over the ov000 75cc handle table —
 * push a 0x1c000/0x600 config (mode 2) via 0201e964, reset+release on fresh
 * tag. */
#include "ov011_core.h"
extern char data_ov000_021c74ec[];
extern void func_0201e7ac(void *h, int v);
extern void func_0201e910(int a, int b, void *cfg, int d, int e, int f, int g,
                          int h, int i, int j, int k, int l);
extern void func_0201e798(void *h, int v);
extern void func_0207fc40(void *h, int flags);
void func_ov011_021cc500(int idx, int a1, int a2, int a3, void *p5) {
    void *h = ((void **)data_ov000_021c74ec)[idx];
    if (a1 != -1) func_0201e7ac(h, (unsigned int)(a1 << 16) >> 16);
    func_0201e910(2, *(int *)((char *)h + 0x2C), p5, 0,
                  0, 0, a3, a2, 0x1C000, 0x600, 0, 0);
    if (a1 != -1) return;
    func_0201e798(h, 1);
    func_0207fc40(h, 0x1000);
}
