/* func_ov002_0228b1b8: fill an 11-int stack buffer via
 * func_ov002_0227b090(CD3F4->f_4, CD3F4->f_20, buf), then compare
 * (func_ov002_021c8470(CD3F4->f_0, CD3F4->f_1c) - 0x190) against
 * buf[6] (the buffer's +0x18 slot), signed.
 */
#include "ov002_core.h"

extern void func_ov002_0227b090(int a, int b, int *out);
extern int func_ov002_021c8470(int a, int b);

int func_ov002_0228b1b8(void) {
    int buf[11];
    int x;

    func_ov002_0227b090(*(int *)(data_ov002_022cd3f4 + 0x4),
                         *(int *)(data_ov002_022cd3f4 + 0x20), buf);
    x = func_ov002_021c8470(*(int *)(data_ov002_022cd3f4 + 0x0),
                             *(int *)(data_ov002_022cd3f4 + 0x1c));
    return (x - 0x190) > buf[6];
}
