/* func_ov016_021b5e5c: render a 0..99 value (clamped) as a 2-digit string into a
 * scratch buffer and blit it to VRAM at arg0; the leading-digit highlight flag is
 * set when the tens-or-units digit is 1. */
#include "ov016_core.h"
extern char data_02102bb0[];
extern void func_02094410(int val, void *dst, int n);
extern void func_02091554(void *a, void *b, int c);
extern void func_02001cec(void *a, int b, int c);
extern void func_02004f3c(void *a, void *b, void *c, int d, int e, int f);
extern void func_0209445c(void *a, void *b, int n);
void func_ov016_021b5e5c(int arg0, int arg1) {
    char local[8];
    char buf[128];
    int flag = 0;
    func_02094410(0, buf, 128);
    if (arg1 / 10 == 1 || arg1 % 10 == 1) flag = 1;
    func_02091554(local, data_ov016_021b923c, arg1);
    func_02001cec(data_02102bb0, 2, 2);
    func_02004f3c(data_02102bb0, local, buf, flag, 2, 10);
    func_0209445c(buf, arg0, 128);
}
