/* func_ov016_021b398c: reset + rebuild the main list object — same 10-arg
 * builder (func_0201ef90) as the row-group family, layer 2 / depth 512, no prior
 * release. */
#include "ov016_core.h"
extern void func_0201e7e0(void);
extern void func_02093820(void);
extern void func_0201ef90(void *a, void *b, void *c, int d, int e, int f, void *g, int h, int i, void *j);
void func_ov016_021b398c(void *arg0, void *arg1) {
    char *p = arg0;
    func_0201e7e0();
    func_02093820();
    func_0201ef90(p + 20, p + 24, p + 28, 0, 0, 2, arg1, 1, 512, p + 144);
}
