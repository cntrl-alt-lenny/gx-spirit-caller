#include "ov008_core.h"
extern void func_02021278(void);
extern void func_02021064(void);
extern void func_0200ad74(void);
void func_ov008_021b2078(void) {
    if ((*(int **)data_ov008_021b25ec)[1]) {     /* o->f4 */
        func_02021278();
        (*(int **)data_ov008_021b25ec)[1] = 0;
    }
    if ((*(int **)data_ov008_021b25ec)[0]) {     /* o->f0 */
        func_02021278();
        (*(int **)data_ov008_021b25ec)[0] = 0;
    }
    func_02021064();
    func_0200ad74();
}
