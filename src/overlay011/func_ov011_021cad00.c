/* func_ov011_021cad00: in view-mode 3, fetch coord arg0 (021d1110), nudge it up
 * a tile when the slot is idle/closing, push it via 021cd940, and stash arg0's
 * id into 403c.25C bits 22:15. Otherwise just 021cdb94. */
#include "ov011_core.h"
extern void func_ov011_021d1110(int slot, int *out_x, int *out_y);
extern int func_ov011_021d0ffc(int slot);
extern void func_ov011_021cf048(void);
extern void func_ov011_021cd940(void *xy);
extern void func_ov011_021cdb94(void);
void func_ov011_021cad00(int arg0) {
    char *s = data_ov011_021d403c;
    int xy[2];
    if (((unsigned int)(*(int *)(data_ov011_021d4000 + 0x27C) << 29) >> 29) == 3) {
        func_ov011_021d1110(arg0, &xy[0], &xy[1]);
        if (func_ov011_021d0ffc(arg0) == 0 || func_ov011_021d0ffc(arg0) == 2)
            xy[0] += 0x10000;
        func_ov011_021cf048();
        func_ov011_021cd940(xy);
        *(int *)(s + 0x25C) = (*(int *)(s + 0x25C) & 0xFF807FFF) | ((unsigned int)(arg0 << 24) >> 9);
        return;
    }
    func_ov011_021cdb94();
}
