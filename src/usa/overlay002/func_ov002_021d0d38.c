/* func_ov002_021d0d38: decode func_ov002_021b939c(f4)'s packed result
 * (byte0/byte1/hi16, same idiom as func_ov002_021b9a84), gate byte1
 * against f2, then look up a slot via func_ov002_021c9310, stash its
 * value on the stack, hand it to func_ov002_021ba350, push it onto the
 * f6-selected list (021ba1a0/021ba11c), post event 0x14, and always
 * clear ce950.f80c. */
#include "ov002_core.h"

extern int func_ov002_021b939c(int val);
extern int *func_ov002_021c9310(int b0, int b1, int hi);
extern void func_ov002_021ba350(int flag, int *out);
extern void func_ov002_021ba0c0(int arg0, int arg1);
extern void func_ov002_021ba03c(int arg0, int arg1);

void func_ov002_021d0d38(void) {
    int flag = (*(u16 *)(data_ov002_022ce870 + 0) & 0x8000) != 0;
    u16 f2 = *(u16 *)(data_ov002_022ce870 + 2);
    u16 f4 = *(u16 *)(data_ov002_022ce870 + 4);
    u16 f6 = *(u16 *)(data_ov002_022ce870 + 6);

    int result = func_ov002_021b939c(f4);
    u16 lo = (u16)result;
    int b1 = (lo >> 8) & 0xff;

    if (b1 == f2) {
        int b0 = result & 0xff;
        u16 hi = (u16)((unsigned int)result >> 16);
        int *p = func_ov002_021c9310(b0, b1, hi);
        int local = *p;

        func_ov002_021ba350(flag, &local);

        if (f6 != 0) {
            func_ov002_021ba0c0(flag, (int)&local);
        } else {
            func_ov002_021ba03c(flag, (int)&local);
        }

        func_ov002_0229acd0(0x14, flag, 0xd, 0);
    }

    *(int *)(data_ov002_022ce870 + 0x80c) = 0;
}
