/* func_ov011_021d1ce8: when the secondary view is in mode 1, run 021ce4d4 and
 * set the low byte of 403c.unk284. */
#include "ov011_core.h"
extern void func_ov011_021ce4d4(void);
void func_ov011_021d1ce8(void) {
    char *b = data_ov011_021d403c;
    if (*(int *)(b + 0x264) != 1)
        return;
    func_ov011_021ce4d4();
    *(int *)(b + 0x284) = (*(int *)(b + 0x284) & ~0xFF) | 1;
}
