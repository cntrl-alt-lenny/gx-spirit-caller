/* func_ov011_021d0c38: find the first free coord slot (unk18 bit-5 clear) of
 * 10, init it via 021d0bb0, bump the 0x19C alloc counter, return its index
 * (or -1 if full). */
#include "ov011_core.h"
extern void func_ov011_021d0bb0(void *slot);
int func_ov011_021d0c38(void) {
    char *b = data_ov011_021d4660;
    char *p = b;
    unsigned int i = 0;
    for (;;) {
        if (((unsigned int)(*(int *)(p + 0x18) << 26) >> 31) == 0) break;
        i++;
        p += 40;
        if (i >= 10) break;
    }
    if (i == 10) return -1;
    func_ov011_021d0bb0(b + i * 40);
    {
        int v = *(int *)(b + 0x19C);
        *(int *)(b + 0x19C) = (v & ~0xFF) | ((((unsigned int)(v << 24) >> 24) + 1) & 0xFF);
    }
    return i;
}
