/* func_ov002_02293e80: func_ov002_02280a1c fills (A,B) for the other player
 * and (C,D) for self->b0. Reject if C > max(A,B); otherwise return whether
 * D > max(A,B). */
#include "ov002_core.h"

extern void func_ov002_02280a1c(int player, int *out1, int *out2, int flag);

int func_ov002_02293e80(struct Ov002Self *self) {
    int A, B, C, D;
    int max_ab;

    func_ov002_02280a1c(1 - self->b0, &A, &B, 1);
    func_ov002_02280a1c(self->b0, &C, &D, 1);

    max_ab = (A > B) ? A : B;
    if (C > max_ab)
        return 0;
    max_ab = (A > B) ? A : B;
    return D > max_ab;
}
