/* func_ov006_021b7b48: reset a subobject, then run a fixed 5-step per-index
 * pass over it. Returns 1. (5-iter-pass family — 021b7b78 is the sibling.) */
extern void func_ov006_021b7cfc(void *p);
extern void func_ov006_021b7bb0(void *p, int i);
int func_ov006_021b7b48(void *p) {
    int i;
    func_ov006_021b7cfc(p);
    for (i = 0; i < 5; i++)
        func_ov006_021b7bb0(p, i);
    return 1;
}
