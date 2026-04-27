/* func_ov006_021c6bdc: minimal pass-through thunk to func_0202cdf8.
 * Cross-module thunk (overlay → main). Tests whether mwcc-C also handles
 * cross-module pool relocs cleanly (.s pipeline tripped on these in wave 9).
 */

extern void func_0202cdf8(void *p);

void func_ov006_021c6bdc(void *p) {
    func_0202cdf8(p);
}
