/* func_ov002_021e72b4: ce288-keyed dispatcher — the first matching gate
 * decides which sub-handler (or constant) is returned. */
#include "ov002_core.h"

extern int func_ov002_021e3cbc(void);
extern int func_ov002_021e4ab8(void);
extern int func_ov002_02256f44(void);
extern int func_ov002_021e70b4(void);
extern int func_ov002_022464ec(void);

int func_ov002_021e72b4(void) {
    if (CE288->f_598 != 0)
        return func_ov002_021e3cbc();
    if (CE288->f_5a0 != 0)
        return func_ov002_021e4ab8();
    if (func_ov002_02256f44() != 0)
        return 1;
    if (CE288->f_490 != 0)
        return func_ov002_021e70b4();
    if (CE288->f_688 == 0)
        return 0;
    return func_ov002_022464ec();
}
