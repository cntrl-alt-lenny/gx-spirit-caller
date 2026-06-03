/* func_ov016_021b35dc: clear the three OAM/VRAM regions (4K/4K/2K) then release
 * the record's live handle (unk90) if any; return 1. */
#include "ov016_core.h"
extern int func_0208e1cc(void);
extern int func_0208e120(void);
extern int func_0208e0a0(void);
extern void func_02094504(int val, int dst, int n);
extern void func_0201ef3c(int a, void *b, void *c);
int func_ov016_021b35dc(void *arg0) {
    char *p = arg0;
    func_02094504(0, func_0208e1cc(), 4096);
    func_02094504(0, func_0208e120(), 4096);
    func_02094504(0, func_0208e0a0(), 2048);
    if (*(int *)(p + 144) != 0) {
        func_0201ef3c(*(int *)(p + 20), p + 28, p + 144);
        *(int *)(p + 148) = 0;
        *(int *)(p + 144) = 0;
    }
    return 1;
}
