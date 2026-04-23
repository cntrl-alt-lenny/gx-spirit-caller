/* func_ov015_021b2348: save-restore wrapper — passes the caller's
 * arg to func_ov005_021aa4ac, then returns the arg unchanged.
 * Overlay-swap sibling of func_ov010_021b2348 (same 0x021b2348 address,
 * different overlay's copy of the region — dsd treats them as separate).
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_ov005_021aa4ac
 *     mov   r0, r4
 *     ldmia sp!, {r4, pc}
 */

extern void func_ov005_021aa4ac(void *x);

void *func_ov015_021b2348(void *x) {
    func_ov005_021aa4ac(x);
    return x;
}
