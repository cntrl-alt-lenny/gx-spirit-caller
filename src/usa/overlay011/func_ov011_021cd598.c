/* func_ov011_021cd598: in view-mode 1, drive the 021d2d6c/2ca8/2da0 view
 * settle from the 403c.268 nibble (3900 table lookup; mode 13 or 9). */
#include "ov011_core.h"
extern void func_ov011_021d2c7c(int a, int b, int c);
extern void func_ov011_021d2bb8(int a, int b, int c);
extern void func_ov011_021d2cb0(int a);
extern char data_ov011_021d3820[];
void func_ov011_021cd598(void) {
    char *s = data_ov011_021d3f5c;
    if (*(int *)(data_ov011_021d3f20 + 0x2A0) != 1) return;
    func_ov011_021d2c7c(32, 32,
        *(int *)(data_ov011_021d3820 + (((unsigned int)(*(int *)(s + 0x268) << 23) >> 28) << 2)));
    func_ov011_021d2bb8(*(int *)(s + 0x2A0), *(int *)(s + 0x21C), *(int *)(s + 0x220));
    {
        int r = 13;
        if (((unsigned int)(*(int *)(s + 0x268) << 23) >> 28) == 3) r ^= 4;
        func_ov011_021d2cb0(r);
    }
}
