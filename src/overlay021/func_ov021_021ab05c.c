/* func_ov021_021ab05c: reset the subobject — if it holds a live handle, release
 * it and clear the slot, then re-init it empty. Returns 1. (ov021_core.h) */
extern void func_020212cc(int);
extern void func_ov021_021abb6c(void *, int);
int func_ov021_021ab05c(void *o) {
    if (*(int *)o != 0) {
        func_020212cc(*(int *)o);
        *(int *)o = 0;
    }
    func_ov021_021abb6c(o, 0);
    return 1;
}
