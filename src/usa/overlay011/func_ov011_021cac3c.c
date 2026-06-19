/* func_ov011_021cac3c: in view-mode 3, fetch coord arg0 (021d1110), nudge it up
 * a tile when the slot is idle/closing, push it via 021cd940, and stash arg0's
 * id into 403c.25C bits 22:15. Otherwise just 021cdb94. */
#include "ov011_core.h"
extern void func_ov011_021d104c(int slot, int *out_x, int *out_y);
extern int func_ov011_021d0f38(int slot);
extern void func_ov011_021cef84(void);
extern void func_ov011_021cd87c(void *xy);
extern void func_ov011_021cdad0(void);
void func_ov011_021cac3c(int arg0) {
    char *s = data_ov011_021d3f5c;
    int xy[2];
    if (((unsigned int)(*(int *)(data_ov011_021d3f20 + 0x27C) << 29) >> 29) == 3) {
        func_ov011_021d104c(arg0, &xy[0], &xy[1]);
        if (func_ov011_021d0f38(arg0) == 0 || func_ov011_021d0f38(arg0) == 2)
            xy[0] += 0x10000;
        func_ov011_021cef84();
        func_ov011_021cd87c(xy);
        *(int *)(s + 0x25C) = (*(int *)(s + 0x25C) & 0xFF807FFF) | ((unsigned int)(arg0 << 24) >> 9);
        return;
    }
    func_ov011_021cdad0();
}
