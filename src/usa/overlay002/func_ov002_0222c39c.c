/* func_ov002_0222c39c: guard cd3f4.f_14==0. Read cd3f4.f_24 as a gate,
 * plus cd3f4.f_4/f_20 unconditionally (matches the original's load-
 * before-branch order). If the gate is set: save+zero the cf1a4 u16
 * slot at (f_4&1)*0x868+f_20*20, call func_ov002_021de3c0(arg0,f_4,
 * f_20), then restore the slot (re-reading f_4/f_20 fresh, since the
 * call may have changed them). Else just call func_ov002_021de3c0
 * directly with the same args. Always returns 0. */
#include "ov002_core.h"

extern int func_ov002_021de3c0(int arg0, int arg1, int arg2);

int func_ov002_0222c39c(int arg0) {
    if (*(int *)(data_ov002_022cd314 + 0x14) != 0)
        return 0;
    if (*(int *)(data_ov002_022cd314 + 0x24) != 0) {
        int f_4 = *(int *)(data_ov002_022cd314 + 4);
        int f_20 = *(int *)(data_ov002_022cd314 + 0x20);
        char *base = data_ov002_022cf0c4 + (f_4 & 1) * 0x868;
        u16 *addr = (u16 *)(base + f_20 * 20);
        u16 saved = *addr;
        *addr = 0;
        func_ov002_021de3c0(arg0, f_4, f_20);
        {
            int f_4b = *(int *)(data_ov002_022cd314 + 4);
            int f_20b = *(int *)(data_ov002_022cd314 + 0x20);
            *(u16 *)(data_ov002_022cf0c4 + (f_4b & 1) * 0x868 + f_20b * 20) = saved;
        }
    } else {
        int f_4 = *(int *)(data_ov002_022cd314 + 4);
        int f_20 = *(int *)(data_ov002_022cd314 + 0x20);
        func_ov002_021de3c0(arg0, f_4, f_20);
    }
    return 0;
}
