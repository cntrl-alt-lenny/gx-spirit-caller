/* func_ov010_021b691c: count how many handles from the first up to arg1 (walking
 * the manager's sibling chain) pass the type-1 predicate; 0 if the chain breaks. */
#include "ov010_core.h"
extern int func_ov005_021ab318(int a);
extern int func_ov005_021ab274(int a, int b, int *c);
extern int func_ov005_021ab384(int a, int b, int c);
extern int func_ov005_021ab2e0(int a, int *b);
int func_ov010_021b691c(int arg0, int arg1) {
    int slot[3];
    int cnt;
    int h = func_ov005_021ab274(arg0, func_ov005_021ab318(arg0), slot);
    cnt = 0;
    if (func_ov005_021ab384(arg0, h, 1) != 0) cnt++;
    while (h != arg1) {
        h = func_ov005_021ab2e0(arg0, slot);
        if (h == 0) { cnt = 0; break; }
        if (func_ov005_021ab384(arg0, h, 1) != 0) cnt++;
    }
    return cnt;
}
