/* func_ov016_021b2688: tear down subsystem A — snapshot its result, run cleanup,
 * then disable sound channels 1 and 2 on both engines; return the snapshot. */
#include "ov016_core.h"
extern int func_ov016_021b2e6c(void *a);
extern void func_ov016_021b2c4c(void *a);
extern void func_02005e04(int ch);
extern void func_02005c84(int ch);
int func_ov016_021b2688(void) {
    int r = func_ov016_021b2e6c(data_ov016_021ba9e4);
    func_ov016_021b2c4c(data_ov016_021ba9e4);
    func_02005e04(1);
    func_02005e04(2);
    func_02005c84(1);
    func_02005c84(2);
    return r;
}
