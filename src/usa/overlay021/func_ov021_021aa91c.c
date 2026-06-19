/* func_ov021_021aa91c: reset the subobject — release any live handle and clear
 * the slot, re-init it empty, then reset its capture register. Returns 1.
 * (ov021_core.h) */
extern void func_02021278(int);
extern void func_ov021_021aac7c(void *, int);
extern void func_02036540(int, int);
int func_ov021_021aa91c(void *o) {
    if (*(int *)o != 0) {
        func_02021278(*(int *)o);
        *(int *)o = 0;
    }
    func_ov021_021aac7c(o, 0);
    func_02036540(0x8f00004, 0);
    return 1;
}
