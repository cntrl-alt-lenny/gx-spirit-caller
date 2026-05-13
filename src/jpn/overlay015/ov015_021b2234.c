/* func_ov015_021b2234: pass-through with side-call.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0                 ; cache arg in callee-saved
 *     bl    func_ov000_021aa3c0    ; cross-overlay call (discarded)
 *     mov   r0, r4                 ; restore original arg as return
 *     ldmia sp!, {r4, pc}
 *
 * Calls `func_ov000_021aa3c0` (or whichever `*_021aa4a0` from the
 * active overlay set — dsd notes the reloc resolves across
 * ov000/ov002/ov005/ov008/ov009/ov018/ov020/ov021/ov022), then
 * returns the input `x` unchanged.
 */

extern int func_ov000_021aa3c0(int x);

int func_ov015_021b2234(int x) {
    func_ov000_021aa3c0(x);
    return x;
}
