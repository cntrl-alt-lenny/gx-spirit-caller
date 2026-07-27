/* func_ov002_02243fa0: guard chain -- bail -1 if func_ov002_021bcf50(self->b0)
 * is -1, bail -1 if func_ov002_022576f4(self) is 0, else tail-call
 * func_ov002_0223f59c(self, b). */
#include "ov002_core.h"
extern int func_ov002_021bcf50(int a);
extern int func_ov002_022576f4(void *self);
extern int func_ov002_0223f59c(void *self, int b);

int func_ov002_02243fa0(struct Ov002Self *self, int b) {
    if (func_ov002_021bcf50(self->b0) == -1) return -1;
    if (func_ov002_022576f4(self) == 0) return -1;
    return func_ov002_0223f59c(self, b);
}
