/* func_ov016_021b2788: tear down subsystem A — snapshot its result, run cleanup,
 * then disable sound channels 1 and 2 on both engines; return the snapshot. */
#include "ov016_core.h"
extern int func_ov016_021b2f6c(void *a);
extern void func_ov016_021b2d4c(void *a);
extern void func_02005e20(int ch);
extern void func_02005ca0(int ch);
int func_ov016_021b2788(void) {
    int r = func_ov016_021b2f6c(data_ov016_021bab44);
    func_ov016_021b2d4c(data_ov016_021bab44);
    func_02005e20(1);
    func_02005e20(2);
    func_02005ca0(1);
    func_02005ca0(2);
    return r;
}
