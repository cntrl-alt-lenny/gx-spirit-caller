/* func_ov011_021cc8bc: rebuild the current player's status cell — fetch its
 * handle from the 40c4 table, reset it, push a fresh 0x1d680/64 cell config,
 * then release the handle. */
#include "ov011_core.h"
extern int func_020190c0(void);
extern char data_ov011_021d40c4[];
extern int func_ov011_021ca094(void);
extern void func_0201e7ec(void *h, int v);
extern void func_0201e964(int a, int b, void *cfg, int d, int e, int f, int g,
                          int h, int i, int j, int k, int l);
extern void func_0207fd28(void *h, int flags);
void func_ov011_021cc8bc(void) {
    void *h = ((void **)data_ov011_021d40c4)[func_020190c0()];
    int cfg[2];
    cfg[0] = 0;
    cfg[1] = func_ov011_021ca094();
    func_0201e7ec(h, 1);
    func_0201e964(2, *(int *)((char *)h + 0x2C), cfg, 0,
                  0, 0, 16, 0, 0x1D680, 64, 0, 0);
    func_0207fd28(h, 0x1000);
}
