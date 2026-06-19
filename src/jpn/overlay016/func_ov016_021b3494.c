/* func_ov016_021b3494: sibling of 021b3560 — read the source record a3, offset
 * its first two shorts by the stack args, pack into a stack record, forward. */
#include "ov016_core.h"
extern void func_ov016_021b3398(int a, int b, int c, void *rec);
void func_ov016_021b3494(int a0, int a1, int a2, unsigned short *a3, int a4, int a5) {
    short s[6];
    s[0] = a3[0] + a4;
    s[1] = a3[1] + a5;
    s[3] = a3[3];
    s[4] = a3[4];
    func_ov016_021b3398(a0, a1, a2, s);
}
