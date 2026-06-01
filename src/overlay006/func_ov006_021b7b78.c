/* func_ov006_021b7b78: 5-iter-pass family sibling of 021b7b48 — same shape
 * with an extra setup call (021b7e80) before the loop. */
extern void func_ov006_021b7cfc(void *p);
extern void func_ov006_021b7e80(void *p);
extern void func_ov006_021b7bb0(void *p, int i);
int func_ov006_021b7b78(void *p) {
    int i;
    func_ov006_021b7cfc(p);
    func_ov006_021b7e80(p);
    for (i = 0; i < 5; i++)
        func_ov006_021b7bb0(p, i);
    return 1;
}
