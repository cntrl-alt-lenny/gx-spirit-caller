/* func_0205d9b8: thin wrapper — dereference arg, pass to func_020b377c,
 * return its high 32 bits (`mov r0, r1` post-call). func_020b377c
 * returns s64 (low in r0, high in r1); this function extracts the
 * high half and returns it as int.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     ldr   r0, [r0, #0x0]
 *     bl    func_020b377c
 *     mov   r0, r1
 *     add   sp, sp, #0x4
 *     ldmfd sp!, {pc}
 *
 * 7 insns / 0x1c bytes.
 *
 * **Routing: `.legacy_sp3.c` (mwcc 1.2/sp3).** The orig shape
 * `push {lr}; sub sp, #4; ...; add sp, #4; pop {pc}` is the
 * "sp3 prologue with Style B `pop {regs, pc}` epilogue" pattern
 * documented in `docs/research/sp3-routing-decision.md`.
 *
 * Routing comparison (verified empirically for this function):
 *   - `.c`       (mwcc 2.0/sp1p5): compact `push {r3, lr}; ...;
 *                pop {r3, pc}` — 5 insns, uses r3 as alignment pad.
 *                Wrong shape.
 *   - `.legacy.c` (mwcc 1.2/sp2p3): explicit `push {lr}; sub sp,#4;
 *                ...; add sp,#4; pop {lr}; bx lr` — 8 insns, Style A
 *                epilogue. Wrong shape (Style A vs Style B).
 *   - `.legacy_sp3.c` (mwcc 1.2/sp3): explicit `push {lr}; sub sp,#4;
 *                ...; add sp,#4; pop {pc}` — 7 insns, Style B epilogue.
 *                ✓ MATCH.
 *
 * Brief 198 permuter best score 315 (didn't converge); brief 201
 * manually closed via routing.
 */

typedef long long s64;

extern s64 func_020b377c(int x);

int func_0205d9b8(int *p) {
    return (int)(func_020b377c(*p) >> 32);
}
