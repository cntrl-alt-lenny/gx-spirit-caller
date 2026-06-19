/* func_ov011_021caa38: classify the view origin via 021ca400; return *arg0 =
 * the 2A4 mode nibble and a palette/region byte from the 305f or 3178 table
 * (selected by the 2AC overlay flag), with *arg1 the secondary index. */
#include "ov011_core.h"
extern int func_ov011_021ca320(int x, int y);
extern char data_ov011_021d2f6f[];
extern char data_ov011_021d3088[];
int func_ov011_021caa38(int *arg0, int *arg1) {
    char *s = data_ov011_021d3f5c;
    int v = func_ov011_021ca320(*(int *)(data_ov011_021d3f20 + 0x258) >> 12,
                                *(int *)(data_ov011_021d3f20 + 0x25C) >> 12) & 0xF;
    *arg0 = (unsigned int)(*(int *)(data_ov011_021d3f20 + 0x2A4) << 23) >> 28;
    if (((unsigned int)(*(int *)(data_ov011_021d3f20 + 0x2AC) << 24) >> 24) != 0) {
        *arg1 = (unsigned int)(*(int *)(s + 0x270) << 24) >> 24;
        return *(unsigned char *)(data_ov011_021d2f6f
            + (((unsigned int)(*(int *)(s + 0x268) << 23) >> 28) << 3)
            + (((unsigned int)(*(int *)(s + 0x270) << 24) >> 24) & 0xF));
    }
    *arg1 = v;
    return *(unsigned char *)(data_ov011_021d3088
        + (((unsigned int)(*(int *)(s + 0x268) << 23) >> 28) << 4) + (v - 1));
}
