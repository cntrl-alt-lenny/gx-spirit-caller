/* func_ov002_0228b0a8: fill an 11-int stack buffer via
 * func_ov002_0227afa0(CD3F4->f_4, CD3F4->f_20, buf), then compare
 * (func_ov002_021c8390(CD3F4->f_0, CD3F4->f_1c) - 0x190) against
 * buf[6] (the buffer's +0x18 slot), signed.
 */
#include "ov002_core.h"

extern void func_ov002_0227afa0(int a, int b, int *out);
extern int func_ov002_021c8390(int a, int b);

int func_ov002_0228b0a8(void) {
    int buf[11];
    int x;

    func_ov002_0227afa0(*(int *)(data_ov002_022cd314 + 0x4),
                         *(int *)(data_ov002_022cd314 + 0x20), buf);
    x = func_ov002_021c8390(*(int *)(data_ov002_022cd314 + 0x0),
                             *(int *)(data_ov002_022cd314 + 0x1c));
    return (x - 0x190) > buf[6];
}
