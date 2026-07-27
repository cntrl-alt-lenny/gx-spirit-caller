/* func_020779cc: bounds-checked forward to func_02091734. Brief 674
 * checked this "pointer-call" shape and concluded it was NOT a
 * trampoline-arity false positive (the existing draft already modeled
 * the callee's real arity) -- reconfirmed here directly: func_02091734
 * itself saves BOTH incoming registers in its own first two
 * instructions (a genuine 2-argument function), and this caller's
 * `mov r1, r0` at entry forwards the incoming id untouched all the way
 * to the call, matching that arity exactly.
 */
extern void *data_021a62f0[];
extern void func_02091734(void *ptr, int id);

void func_020779cc(int id) {
    if ((unsigned int)id >= 0x20) return;
    func_02091734(data_021a62f0[1], id);
}
