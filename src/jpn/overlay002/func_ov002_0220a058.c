/* func_ov002_0220a058: sibling of 022090b8 — opponent-active and phase <= 3. */
#include "ov002_core.h"
int func_ov002_0220a058(struct Ov002Self *arg0) {
    if (*(int *)(data_ov002_022d008c + 3308) != 1 - arg0->b0) return 0;
    return (unsigned)*(int *)(data_ov002_022d008c + 3320) <= 3;
}
