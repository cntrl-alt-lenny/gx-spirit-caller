/* func_ov002_021d1afc: if the pending id (d016c+3396) matches ce950's cached id
 * (+4), run func_ov002_021d1a88; then clear ce950+2060. */
#include "ov002_core.h"
extern void func_ov002_021d1a88(void);
void func_ov002_021d1afc(void) {
    if (*(int *)(data_ov002_022d008c + 3396) == *(u16 *)(data_ov002_022ce870 + 4))
        func_ov002_021d1a88();
    *(int *)(data_ov002_022ce870 + 2060) = 0;
}
