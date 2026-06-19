/* func_ov016_021b388c: reset + rebuild the main list object — same 10-arg
 * builder (func_0201ef3c) as the row-group family, layer 2 / depth 512, no prior
 * release. */
#include "ov016_core.h"
extern void func_0201e78c(void);
extern void func_0209372c(void);
extern void func_0201ef3c(void *a, void *b, void *c, int d, int e, int f, void *g, int h, int i, void *j);
void func_ov016_021b388c(void *arg0, void *arg1) {
    char *p = arg0;
    func_0201e78c();
    func_0209372c();
    func_0201ef3c(p + 20, p + 24, p + 28, 0, 0, 2, arg1, 1, 512, p + 144);
}
