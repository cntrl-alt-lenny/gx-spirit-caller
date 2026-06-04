/* func_ov021_021aa9fc: reset the subobject — release any live handle and clear
 * the slot, re-init it empty, then reset its capture register. Returns 1.
 * (ov021_core.h) */
extern void func_020212cc(int);
extern void func_ov021_021aad5c(void *, int);
extern void func_02036590(int, int);
int func_ov021_021aa9fc(void *o) {
    if (*(int *)o != 0) {
        func_020212cc(*(int *)o);
        *(int *)o = 0;
    }
    func_ov021_021aad5c(o, 0);
    func_02036590(0x8f00004, 0);
    return 1;
}
