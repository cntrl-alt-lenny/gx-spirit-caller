/* func_ov002_0220af54: two guarded calls, both taking (1 - self->b0); each
 * false result returns 1 early, otherwise return 2. */
#include "ov002_core.h"
extern int func_ov002_021ca5b8(int a, int b);
extern int func_ov002_021bd284(int a, int b);

int func_ov002_0220af54(struct Ov002Self *self) {
    if (!func_ov002_021ca5b8(self->b0, 1 - self->b0)) goto ret1;
    if (!func_ov002_021bd284(1 - self->b0, 7)) goto ret1;
    return 2;
ret1:
    return 1;
}
