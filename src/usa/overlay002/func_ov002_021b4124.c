/* func_ov002_021b4124: look up node arg0 in the id table and return whether it
 * resolves to a live object (arg1 passed through to the resolver). */
#include "ov002_core.h"
extern char data_ov002_022d0172[];
extern int func_ov002_021b3b30(int id, int arg1);
int func_ov002_021b4124(int arg0, int arg1) {
    return func_ov002_021b3b30(*(u16 *)(data_ov002_022d0172 + arg0 * 4), arg1) != 0;
}
