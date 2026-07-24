/* func_ov016_021b5fb0: render a 0..99 value (clamped) as a 2-digit string into a
 * scratch buffer and blit it to VRAM at arg0; the leading-digit highlight flag is
 * set when the tens-or-units digit is 1. */
#include "ov016_core.h"
extern char data_02102c90[];
extern void func_02094504(int val, void *dst, int n);
extern void OS_SPrintf(void *a, void *b, int c);
extern void func_02001d0c(void *a, int b, int c);
extern void func_02004f58(void *a, void *b, void *c, int d, int e, int f);
extern void func_02094550(void *a, void *b, int n);
void func_ov016_021b5fb0(int arg0, int arg1) {
    char local[8];
    char buf[128];
    int flag = 0;
    func_02094504(0, buf, 128);
    if (arg1 / 10 == 1 || arg1 % 10 == 1) flag = 1;
    OS_SPrintf(local, data_ov016_021b939c, arg1);
    func_02001d0c(data_02102c90, 2, 2);
    func_02004f58(data_02102c90, local, buf, flag, 2, 10);
    func_02094550(buf, arg0, 128);
}
