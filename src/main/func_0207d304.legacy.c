/* func_0207d304: byte-then-halfword cast on a halfword load at
 * negative offset. 20-byte leaf, no pool.
 *
 * Orig shape (20 bytes, 5 ARM insns):
 *
 *     ldrh  r0, [r0, #-14]               ; load u16 at *(p - 7)
 *     and   r0, r0, #0xff                ; mask low byte
 *     lsl   r0, r0, #16                  ; shift left 16
 *     lsr   r0, r0, #16                  ; shift right 16 — (u16) cast
 *     bx    lr
 *
 * The trailing `lsl #16; lsr #16` is **semantically redundant**
 * after `and #0xff` (the value is already ≤ 0xff). It's a
 * compiler artifact of the orig source's chained `(u16)(u8)x`
 * cast — mwcc 1.2/sp2p3 (the legacy tier) preserves both casts
 * literally; mwcc 2.0/sp1p5 peepholes the redundant pair away
 * (which is why brief 216's plain `.c` attempt at 0% fuzzy
 * failed — it routed under default 2.0/sp1p5).
 *
 * Brief 225 sub-pattern of C-38 family (Wall 2 sibling). See
 * `docs/research/brief-225-c39-subpatterns-and-c38-deferred.md`
 * for the methodology + variant matrix.
 *
 * Recipe: chained `(u16)(u8)*ptr` cast read via `.legacy.c`
 * routing. mwcc 1.2/sp2p3 emits the redundant casts literally
 * because it lacks the cast-coalescing peephole; mwcc 2.0
 * collapses them.
 */

unsigned int func_0207d304(unsigned short *p) {
    /* p is offset such that p[-7] reads the u16 at byte offset -14 */
    unsigned int v = (unsigned char)*(p - 7);    /* and #0xff */
    return (unsigned short)v;                     /* lsl #16; lsr #16 */
}
