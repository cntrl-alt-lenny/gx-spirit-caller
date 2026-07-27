/* func_02077ab4: bounds-checked forward to func_0209181c. Brief 674
 * checked this "pointer-call" shape and concluded it was NOT a
 * trampoline-arity false positive (the existing draft already modeled
 * the callee's real arity) -- reconfirmed here directly: func_0209181c
 * itself saves BOTH incoming registers in its own first two
 * instructions (a genuine 2-argument function), and this caller's
 * `mov r1, r0` at entry forwards the incoming id untouched all the way
 * to the call, matching that arity exactly.
 */
extern void *data_021a63d0[];
extern void func_0209181c(void *ptr, int id);

void func_02077ab4(int id) {
    if ((unsigned int)id >= 0x20) return;
    func_0209181c(data_021a63d0[1], id);
}
