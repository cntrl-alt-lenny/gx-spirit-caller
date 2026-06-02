/* func_ov004_021d5b9c: when the 0203268c context is live, quiesce its three
 * channels (0203301c/02032fc8/02032fe4), then run the 021d38a4(0) settle. */
#include "ov004_core.h"
extern void *func_0203268c(void);
extern void func_0203301c(void *ctx, int v);
extern void func_02032fc8(void *ctx, int v);
extern void func_02032fe4(void *ctx, int v);
extern void func_ov004_021d38a4(int x);
void func_ov004_021d5b9c(void) {
    if (func_0203268c() != 0) {
        func_0203301c(func_0203268c(), 0);
        func_02032fc8(func_0203268c(), 0);
        func_02032fe4(func_0203268c(), 0);
    }
    func_ov004_021d38a4(0);
}
