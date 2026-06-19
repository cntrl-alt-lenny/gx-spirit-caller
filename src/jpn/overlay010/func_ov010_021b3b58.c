/* func_ov010_021b3b58: (re)open the message window — push two layer configs,
 * run the per-mode opener, set brightness regs, return 1. */
#include "ov010_core.h"
extern void func_ov010_021b31ac(int a, int b, int c);
extern void func_ov010_021b5798(void);
extern void func_ov010_021b789c(void);
extern void func_0208c79c(int reg, int val);
int func_ov010_021b3b58(void) {
    func_ov010_021b31ac(3, 1, 0);
    func_ov010_021b31ac(0, 1, 5);
    switch (*(int *)(data_ov010_021b8c08 + 60)) {
    case 1: func_ov010_021b5798(); break;
    case 2: func_ov010_021b789c(); break;
    case 3: break;
    }
    *(int *)(data_ov010_021b8c08 + 164) = 81920;
    *(int *)(data_ov010_021b8c08 + 160) = 81920;
    func_0208c79c(0x0400006c, -16);
    func_0208c79c(0x0400106c, -16);
    return 1;
}
