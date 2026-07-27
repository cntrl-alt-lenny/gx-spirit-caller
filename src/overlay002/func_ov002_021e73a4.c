/* func_ov002_021e73a4: ce288-keyed dispatcher — the first matching gate
 * decides which sub-handler (or constant) is returned. */
#include "ov002_core.h"

extern int func_ov002_021e3dac(void);
extern int func_ov002_021e4ba8(void);
extern int func_ov002_0225702c(void);
extern int func_ov002_021e71a4(void);
extern int func_ov002_022465d4(void);

int func_ov002_021e73a4(void) {
    if (CE288->f_598 != 0)
        return func_ov002_021e3dac();
    if (CE288->f_5a0 != 0)
        return func_ov002_021e4ba8();
    if (func_ov002_0225702c() != 0)
        return 1;
    if (CE288->f_490 != 0)
        return func_ov002_021e71a4();
    if (CE288->f_688 == 0)
        return 0;
    return func_ov002_022465d4();
}
