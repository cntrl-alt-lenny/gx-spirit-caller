#include "ov008_core.h"
extern void func_020212cc(void);
extern void func_020210b8(void);
extern void func_0200ad90(void);
void func_ov008_021b219c(void) {
    if ((*(int **)data_ov008_021b270c)[1]) {     /* o->f4 */
        func_020212cc();
        (*(int **)data_ov008_021b270c)[1] = 0;
    }
    if ((*(int **)data_ov008_021b270c)[0]) {     /* o->f0 */
        func_020212cc();
        (*(int **)data_ov008_021b270c)[0] = 0;
    }
    func_020210b8();
    func_0200ad90();
}
