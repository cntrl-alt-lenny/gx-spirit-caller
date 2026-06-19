/* func_ov015_021b5954: init the object's two trailing subobjects (the +0x880
 * and +0x850 records), returning the object. (ov015_core.h) */
extern void func_ov015_021b306c(void *);
extern void func_ov015_021b2760(void *);
void *func_ov015_021b5954(void *o) {
    func_ov015_021b306c((char *)o + 0x880);
    func_ov015_021b2760((char *)o + 0x850);
    return o;
}
