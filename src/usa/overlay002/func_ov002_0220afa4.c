/* func_ov002_0220afa4: 1 if arg0's kind (bits 6..11 of +2) is 35; else 1 iff the
 * func_ov002_021bb82c query (keyed on the player flag, 0x1918) returns 3. */
#include "ov002_core.h"
extern int func_ov002_021bb82c(int a, int b);
struct S0220b094 { u16 b0 : 1; u16 pad : 5; u16 k : 6; };
int func_ov002_0220afa4(void *arg0) {
    struct S0220b094 *s = (struct S0220b094 *)((char *)arg0 + 2);
    if (s->k == 35) return 1;
    return func_ov002_021bb82c(s->b0, 0x1918) == 3;
}
