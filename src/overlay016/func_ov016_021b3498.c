/* func_ov016_021b3498: draw a sprite cell — bind the cell's object (slot arg1),
 * optionally set its palette (arg2), build it via the 12-arg object builder, and
 * (when a palette was given) show + flip it. */
#include "ov016_core.h"
extern void func_0201e800(int obj, int pal);
extern void func_0201e964(int a, int b, void *coords, int d, int e, int f, int g, int h, int i, int j, int k, int l);
extern void func_0201e7ec(int obj, int a);
extern void func_0207fd28(int obj, int a);
void func_ov016_021b3498(void *arg0, int arg1, int arg2, unsigned short *arg3) {
    char *p = arg0;
    int coords[2];
    int obj;
    if (*(int *)(p + 144) == 0) return;
    obj = *(int *)(p + arg1 * 4 + 28);
    coords[0] = arg3[0] << 12;
    coords[1] = arg3[1] << 12;
    if (arg2 != -1) func_0201e800(obj, (unsigned short)arg2);
    func_0201e964(2, *(int *)(obj + 44), coords, 0, 0, 0, arg3[4], arg3[3], 0, 0, 0, 0);
    if (arg2 != -1) return;
    func_0201e7ec(obj, 1);
    func_0207fd28(obj, 4096);
}
