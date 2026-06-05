/* func_ov002_02203558: classify arg0 via func_ov002_021b4254 (9-bit kind of +4,
 * the u16 at +0, the u16 at +4) — 2 when the result is <3, else 1. */
#include "ov002_core.h"
extern int func_ov002_021b4254(int a, int b, int c);
int func_ov002_02203558(void *arg0) {
    int r = func_ov002_021b4254((unsigned)(*(u16 *)((char *)arg0 + 4) << 17) >> 23,
                                *(u16 *)arg0, *(u16 *)((char *)arg0 + 4));
    return r < 3 ? 2 : 1;
}
