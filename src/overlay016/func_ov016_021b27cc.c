/* func_ov016_021b27cc: blank both engines' BG mode bits, tear down subsystem A,
 * silence sound channels 1/2, and run the shutdown sequence; return 1. */
#include "ov016_core.h"
extern void func_ov016_021b2cf4(void *a);
extern void func_02005c60(int ch);
extern void func_02001ba4(void);
extern void func_0202c1ac(void);
extern void func_0202af40(void);
extern void func_02006918(void);
int func_ov016_021b27cc(void) {
    *(int *)0x04000000 &= ~7936;
    *(int *)0x04001000 &= ~7936;
    func_ov016_021b2cf4(data_ov016_021bab44);
    func_02005c60(1);
    func_02005c60(2);
    func_02001ba4();
    func_0202c1ac();
    func_0202af40();
    func_02006918();
    return 1;
}
