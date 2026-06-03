/* func_ov004_021d3b74: format a 512-byte string at rec+80 (021d3a7c) and queue
 * it for display via 021d8798. */
#include "ov004_core.h"
extern void func_ov004_021d3a7c(void *dst, int n, int a, int b, int c, int d);
extern void func_ov004_021d8798(void *tag, void *str, int n);
void func_ov004_021d3b74(void *rec, int arg1, int arg2, int arg3, int arg5) {
    char *p = rec;
    func_ov004_021d3a7c(p + 80, 512, arg1, arg2, arg3, arg5);
    func_ov004_021d8798(data_ov004_022915e8, p + 80, 18);
}
