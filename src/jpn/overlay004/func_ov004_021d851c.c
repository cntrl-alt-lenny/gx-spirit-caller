/* func_ov004_021d851c: when busy (b500.88), bump the live handle 0201d050; then
 * release the 0x5F90 record's pending handles (021c9f94). */
#include "ov004_core.h"
extern int func_0201cffc(int x);
extern void func_ov004_021c9eb4(void *rec);
void func_ov004_021d851c(void) {
    char *b = data_ov004_0220b2a0;
    if (*(int *)(b + 0x88) != 0)
        func_0201cffc(*(int *)(b + 0x3C94) + 1);
    func_ov004_021c9eb4(b + 0x5F90);
}
