/* func_ov002_021b422c: sibling of 021b4204 — resolve node arg0's object and
 * return its u16 at +4, or -1 if unresolved (arg1 passed through). */
#include "ov002_core.h"
extern char data_ov002_022d0252[];
extern char *func_ov002_021b3c10(int id, int arg1);
int func_ov002_021b422c(int arg0, int arg1) {
    char *r = func_ov002_021b3c10(*(u16 *)(data_ov002_022d0252 + arg0 * 4), arg1);
    return r ? *(u16 *)(r + 4) : -1;
}
