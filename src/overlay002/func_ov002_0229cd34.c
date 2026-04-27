/* func_ov002_0229cd34: minimal pass-through thunk to func_020347b8.
 * Cross-module thunk (overlay → main). Tests whether mwcc-C also handles
 * cross-module pool relocs cleanly (.s pipeline tripped on these in wave 9).
 */

extern void func_020347b8(void *p);

void func_ov002_0229cd34(void *p) {
    func_020347b8(p);
}
