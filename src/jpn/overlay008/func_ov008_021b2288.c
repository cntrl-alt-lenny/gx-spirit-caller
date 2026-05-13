/* func_ov008_021b2288: minimal pass-through thunk to func_0202cda4.
 * Cross-module thunk (overlay → main). Tests whether mwcc-C also handles
 * cross-module pool relocs cleanly (.s pipeline tripped on these in wave 9).
 */

extern void func_0202cda4(void *p);

void func_ov008_021b2288(void *p) {
    func_0202cda4(p);
}
