/* func_ov002_021d1be4: if the pending id (d016c+3396) matches ce950's cached id
 * (+4), run func_ov002_021d1b70; then clear ce950+2060. */
#include "ov002_core.h"
extern void func_ov002_021d1b70(void);
void func_ov002_021d1be4(void) {
    if (*(int *)(data_ov002_022d016c + 3396) == *(u16 *)(data_ov002_022ce950 + 4))
        func_ov002_021d1b70();
    *(int *)(data_ov002_022ce950 + 2060) = 0;
}
