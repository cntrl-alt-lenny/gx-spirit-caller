/* func_ov002_0229cc24: minimal pass-through thunk to func_02034768.
 * Cross-module thunk (overlay → main). Tests whether mwcc-C also handles
 * cross-module pool relocs cleanly (.s pipeline tripped on these in wave 9).
 */

extern void func_02034768(void *p);

void func_ov002_0229cc24(void *p) {
    func_02034768(p);
}
