/* func_ov016_021b8cd8: row-group rebuild variant (5th of the 8a30 family) — gated
 * on a u16 page index (unk1D0); registers four cell configs (palette index+75),
 * releases the old built object, rebuilds it (layer 2, depth 2048), stores the
 * handle at data_021bb1a4+28. */
#include "ov016_core.h"
extern void OS_SPrintf(void *a, void *b, int c);
extern void func_0201ef3c(int a, void *b, void *c);
extern void func_0201e7e0(void);
extern void func_0201ef90(void *a, void *b, void *c, int d, int e, int f, void *g, int h, int i, void *j);
extern int func_0201ede4(void *a, void *b);
void func_ov016_021b8cd8(void *arg0, void **arg1) {
    char *p = arg0;
    int tmp;
    if (*(unsigned short *)(p + 464) == 0) return;
    OS_SPrintf(arg1[0], data_ov016_021b96d8, *(unsigned short *)(p + 464) + 75);
    OS_SPrintf(arg1[1], data_ov016_021b96f0, *(unsigned short *)(p + 464) + 75);
    OS_SPrintf(arg1[2], data_ov016_021b9708, *(unsigned short *)(p + 464) + 75);
    OS_SPrintf(arg1[3], data_ov016_021b9720, *(unsigned short *)(p + 464) + 75);
    if (*(int *)(p + 452) != 0) {
        func_0201ef3c(*(int *)(p + 368), p + 376, p + 452);
        *(int *)(p + 456) = 0;
        *(int *)(p + 452) = 0;
    }
    func_0201e7e0();
    func_0201ef90(p + 368, p + 372, p + 376, 90112, 2048, 1, arg1, 1, -1, p + 452);
    *(int *)(data_ov016_021bb1a4 + 28) = func_0201ede4(&tmp, arg1[3]);
}
