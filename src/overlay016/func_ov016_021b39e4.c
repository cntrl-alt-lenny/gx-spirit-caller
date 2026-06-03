/* func_ov016_021b39e4: when the page index (unk12) changes, clear the text VRAM
 * and redraw the page-number label. */
#include "ov016_core.h"
extern char data_02102c90[];
extern int func_0208df0c(void);
extern void func_02094504(int val, int dst, int n);
extern void func_02001d0c(void *a, int b, int c);
extern int func_0202c0c0(int id);
extern void func_02004f58(void *a, int b, int c, int d, int e, int f);
void func_ov016_021b39e4(void *arg0) {
    char *p = arg0;
    int r;
    if (*(int *)(p + 16) == *(int *)(p + 12)) return;
    *(int *)(p + 16) = *(int *)(p + 12);
    func_02094504(0, func_0208df0c() + 8384, 13440);
    func_02001d0c(data_02102c90, 30, 14);
    r = func_0202c0c0(*(int *)(p + 12) + 1723);
    func_02004f58(data_02102c90, r, func_0208df0c() + 8384, 2, 2, 12);
}
