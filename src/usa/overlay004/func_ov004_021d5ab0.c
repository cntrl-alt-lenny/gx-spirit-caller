/* func_ov004_021d5ab0: when the 0203268c context is live, quiesce its three
 * channels (0203301c/02032fc8/02032fe4), then run the 021d38a4(0) settle. */
#include "ov004_core.h"
extern void *func_02032638(void);
extern void func_02032fc8(void *ctx, int v);
extern void func_02032f74(void *ctx, int v);
extern void func_02032f90(void *ctx, int v);
extern void func_ov004_021d37c4(int x);
void func_ov004_021d5ab0(void) {
    if (func_02032638() != 0) {
        func_02032fc8(func_02032638(), 0);
        func_02032f74(func_02032638(), 0);
        func_02032f90(func_02032638(), 0);
    }
    func_ov004_021d37c4(0);
}
