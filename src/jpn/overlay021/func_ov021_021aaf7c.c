/* func_ov021_021aaf7c: reset the subobject — if it holds a live handle, release
 * it and clear the slot, then re-init it empty. Returns 1. (ov021_core.h) */
extern void func_02021278(int);
extern void func_ov021_021aba8c(void *, int);
int func_ov021_021aaf7c(void *o) {
    if (*(int *)o != 0) {
        func_02021278(*(int *)o);
        *(int *)o = 0;
    }
    func_ov021_021aba8c(o, 0);
    return 1;
}
