/* func_02078ec8: side-effect halfword load + return (u32)p[-1] << 16.
 *
 *     ldrh r1, [r0, #0x0]                  ; side-effect read of p[0]
 *     ldrh r0, [r0, #-0x2]                 ; r0 = p[-1]
 *     mov  r0, r0, lsl #0x10               ; r0 <<= 16
 *     bx   lr
 *
 * Brief 216 Recipe D: `volatile` pointer-of-u16 + `(void)p[0]`
 * discard cast. The volatile qualifier forces mwcc to emit the
 * dummy read (a side-effect), reaching orig under BOTH 1.2 and
 * 2.0 tiers. Routing as default `.c` (mwcc 2.0/sp1p5).
 *
 * Worked example for `docs/research/wall-2-leaf-no-pool-reg-alloc.md`
 * Recipe D — previously documented but not shipped.
 */

unsigned int func_02078ec8(volatile unsigned short *p) {
    (void)p[0];
    return (unsigned int)p[-1] << 16;
}
