/* func_ov015_021b5a6c: init the object's two trailing subobjects (the +0x880
 * and +0x850 records), returning the object. (ov015_core.h) */
extern void func_ov015_021b316c(void *);
extern void func_ov015_021b2860(void *);
void *func_ov015_021b5a6c(void *o) {
    func_ov015_021b316c((char *)o + 0x880);
    func_ov015_021b2860((char *)o + 0x850);
    return o;
}
