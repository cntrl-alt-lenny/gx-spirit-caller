/* func_ov002_02244088: guard chain -- bail -1 if func_ov002_021bd030(self->b0)
 * is -1, bail -1 if func_ov002_022577dc(self) is 0, else tail-call
 * func_ov002_0223f684(self, b). */
#include "ov002_core.h"
extern int func_ov002_021bd030(int a);
extern int func_ov002_022577dc(void *self);
extern int func_ov002_0223f684(void *self, int b);

int func_ov002_02244088(struct Ov002Self *self, int b) {
    if (func_ov002_021bd030(self->b0) == -1) return -1;
    if (func_ov002_022577dc(self) == 0) return -1;
    return func_ov002_0223f684(self, b);
}
