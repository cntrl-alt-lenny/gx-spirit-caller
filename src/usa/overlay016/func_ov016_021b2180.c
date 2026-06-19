/* func_ov016_021b2180: swap two 84-byte records through a stack temp
 * (func_02094688 is MI_CpuCopy-style: src, dst, size). */
#include "ov016_core.h"
extern void func_02094688(void *src, void *dst, int n);
void func_ov016_021b2180(void *arg0, void *arg1) {
    char tmp[84];
    func_02094688(arg1, tmp, 84);
    func_02094688(arg0, arg1, 84);
    func_02094688(tmp, arg0, 84);
}
