/* func_ov004_021cf600: push the 2211490 record's value (021cec8c) into the
 * 021ca0a4 sink (mode 2, 224x164, flag 1). */
#include "ov004_core.h"
extern int func_ov004_021cec8c(void);
extern void func_ov004_021ca0a4(void *a, int b, int c, int d, int e, int f);
void func_ov004_021cf600(void) {
    func_ov004_021ca0a4(data_ov004_02211490, 2, 224, 164, 1, func_ov004_021cec8c());
}
