/* func_ov002_02202318: 1 iff either player's type-1 query (func_ov002_021bc0d4)
 * is non-zero. */
#include "ov002_core.h"
extern int func_ov002_021bc0d4(int a, int b, int c);
int func_ov002_02202318(void) {
    int a = func_ov002_021bc0d4(0, 1, 0);
    int b = func_ov002_021bc0d4(1, 1, 0);
    return a + b != 0;
}
