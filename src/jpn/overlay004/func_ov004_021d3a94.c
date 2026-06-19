/* func_ov004_021d3a94: format a 512-byte string at rec+80 (021d3a7c) and queue
 * it for display via 021d8798. */
#include "ov004_core.h"
extern void func_ov004_021d399c(void *dst, int n, int a, int b, int c, int d);
extern void func_ov004_021d86ac(void *tag, void *str, int n);
void func_ov004_021d3a94(void *rec, int arg1, int arg2, int arg3, int arg5) {
    char *p = rec;
    func_ov004_021d399c(p + 80, 512, arg1, arg2, arg3, arg5);
    func_ov004_021d86ac(data_ov004_02291388, p + 80, 18);
}
