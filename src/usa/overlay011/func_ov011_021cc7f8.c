/* func_ov011_021cc7f8: rebuild the current player's status cell — fetch its
 * handle from the 40c4 table, reset it, push a fresh 0x1d680/64 cell config,
 * then release the handle. */
#include "ov011_core.h"
extern int func_0201908c(void);
extern char data_ov011_021d3fe4[];
extern int func_ov011_021c9fb4(void);
extern void func_0201e798(void *h, int v);
extern void func_0201e910(int a, int b, void *cfg, int d, int e, int f, int g,
                          int h, int i, int j, int k, int l);
extern void func_0207fc40(void *h, int flags);
void func_ov011_021cc7f8(void) {
    void *h = ((void **)data_ov011_021d3fe4)[func_0201908c()];
    int cfg[2];
    cfg[0] = 0;
    cfg[1] = func_ov011_021c9fb4();
    func_0201e798(h, 1);
    func_0201e910(2, *(int *)((char *)h + 0x2C), cfg, 0,
                  0, 0, 16, 0, 0x1D680, 64, 0, 0);
    func_0207fc40(h, 0x1000);
}
