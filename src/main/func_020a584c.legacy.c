/* func_020a584c: bit-0 extract from p[1] (the second 32-bit word at
 * *p), normalised to 0/1.
 *
 *     ldr   r0, [r0, #0x4]
 *     mov   r0, r0, lsl #0x1f          ; bit-0 -> bit-31
 *     movs  r0, r0, lsr #0x1f          ; back to bit-0, set flags
 *     movne r0, #0x1                   ; redundant (already 0/1)
 *     moveq r0, #0x0                   ; ditto
 *     bx    lr
 *
 * Brief 213 shipped this as `.s` because mwcc 2.0/sp1p5 collapses
 * the natural `(p[1] & 1) ? 1 : 0` C form to `tst r0, #1; movne #1;
 * moveq #0` (one instruction shorter, different shape).
 *
 * Brief 214 (this file) found that the legacy tier mwcc 1.2/sp2p3
 * reaches the exact orig shape from the shift-extract-then-compare
 * source idiom below. The "(unsigned)(x << 31) >> 31" form forces
 * the compiler to emit lsl/lsr explicitly (mwcc 1.2 doesn't have
 * the bit-test peephole that mwcc 2.0 added), and the trailing
 * `if (t != 0u) return 1; return 0` keeps the redundant
 * movne/moveq materialisation that the shape needs.
 *
 * Routing: `.legacy.c` -> mwcc 1.2/sp2p3 (Style A epilogue tier).
 * See `docs/research/bit-test-0-or-1-idiom.md` for the full variant
 * matrix that pinned this idiom.
 */

int func_020a584c(int *p) {
    unsigned t = (unsigned)(p[1] << 31) >> 31;
    if (t != 0u) return 1;
    return 0;
}
