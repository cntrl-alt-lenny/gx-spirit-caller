/* func_ov016_021b26cc: blank both engines' BG mode bits, tear down subsystem A,
 * silence sound channels 1/2, and run the shutdown sequence; return 1. */
#include "ov016_core.h"
extern void func_ov016_021b2bf4(void *a);
extern void func_02005c44(int ch);
extern void func_02001b84(void);
extern void func_0202c158(void);
extern void func_0202aeec(void);
extern void func_020068fc(void);
int func_ov016_021b26cc(void) {
    *(int *)0x04000000 &= ~7936;
    *(int *)0x04001000 &= ~7936;
    func_ov016_021b2bf4(data_ov016_021ba9e4);
    func_02005c44(1);
    func_02005c44(2);
    func_02001b84();
    func_0202c158();
    func_0202aeec();
    func_020068fc();
    return 1;
}
