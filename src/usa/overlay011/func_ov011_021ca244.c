/* func_ov011_021ca244: (re)create the view's main task — tear down the old one,
 * pick its entry from the mode-selected 38a8/38e8 table, spawn via 02006c0c,
 * and cache the task handle/priority/flags into 403c. */
#include "ov011_core.h"
extern void Task_InvokeLocked(int task);
extern char data_ov011_021d37c8[];
extern char data_ov011_021d3808[];
extern int func_02006bf0(int a, int b, int c);
extern int func_0201d6bc(void);
extern int func_0201d6a4(int a);
extern int func_0201d660(int a);
void func_ov011_021ca244(void) {
    char *s = data_ov011_021d3f5c;
    int r5;
    if (*(int *)(data_ov011_021d3f20 + 0x2D0) != 0)
        Task_InvokeLocked(*(int *)(s + 0x294));
    switch (*(int *)(s + 0x264)) {
    case 0: r5 = *(int *)(data_ov011_021d37c8 + 0x40); break;
    case 1: r5 = *(int *)(data_ov011_021d3808 + (((unsigned int)(*(int *)(s + 0x268) << 23) >> 28) << 2)); break;
    }
    *(int *)(s + 0x294) = func_02006bf0(r5, 4, 0);
    *(int *)(s + 0x28C) = func_0201d6bc();
    *(int *)(s + 0x290) = func_0201d6a4(*(int *)(s + 0x294));
    {
        int t = func_0201d660(*(int *)(s + 0x294));
        *(int *)(s + 0x29C) = (*(int *)(s + 0x29C) & ~7) | (t & 7);
    }
}
