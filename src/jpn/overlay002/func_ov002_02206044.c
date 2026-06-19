/* func_ov002_02206044: sibling of 02206100 — require the active player to own the
 * flag, then 1 iff the phase (d016c+3320) is <= 3. */
#include "ov002_core.h"
int func_ov002_02206044(struct Ov002Self *arg0) {
    if (*(int *)(data_ov002_022d008c + 3308) != arg0->b0) return 0;
    return (unsigned)*(int *)(data_ov002_022d008c + 3320) <= 3;
}
