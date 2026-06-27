/* CAMPAIGN-PREP candidate for func_021da1bc (ov004, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     nested for-loops; plain %256 (signed) + plain /8 for the magic; inline i*stride
 *   risk:       loop strength-reduction wall (orig keeps strided base via add lr,#0x20 / r8=base+lr*2; mwcc emits a separate i*0x40 counter) plus 3 magic /8 sites that must each codegen identically. permuter-class.
 *   confidence: low
 */
/* func_ov004_021da1bc: set the top nibble (<<12) of every halfword in a 6x32
 * tile-attribute grid at data_ov004_0220b500+0x50d8, then DMA/blit one or three
 * strips (func_02094550) depending on whether the scroll offset (arg0*48 % 256)
 * fits under 0xd0 or wraps. cls D: nested loop (strength-reduction) + signed
 * modulo-256 (mul;lsr#1f;rsb lsl#18;add ror#18) + several /8 magic divisions.
 *   arg0 = scroll units (r0), arg1 = palette/attr nibble (r1).
 * ** HARD: loop strength-reduction wall + multiple magic divs; first-build match
 *    NOT expected — see risk. Offsets/strides are read off the asm but the grid
 *    struct is inferred (struct-guessed). **
 */
#include "ov004_core.h"
extern int  func_0208e0a0(void);
extern void func_02094550(void *dst, void *src, int n);

int func_ov004_021da1bc(int arg0, int arg1) {
    char *base = data_ov004_0220b500;
    int i, j;
    int off;

    for (i = 0; i < 6; i++) {
        for (j = 0; j < 0x20; j++) {
            unsigned short *e =
                (unsigned short *)(base + i * 0x40 + j * 2 + 0x5000 + 0xd8);
            *e = (*e & 0xfff) | (arg1 << 12);
        }
    }

    off = (arg0 * 0x30) % 256;                 /* signed mod 256 (ror idiom) */
    if (off <= 0xd0) {
        int src = func_0208e0a0();
        func_02094550(base + 0x50d8,
                      (void *)(src + (off / 8) * 0x40),
                      0x180);
        return 0;
    } else {
        int rem = 0x100 - off;                 /* rsb r5, r6, #0x100 */
        int a = ((rem * 0x20) / 8);            /* r6 reused = ((0x100-off)*0x20)/8 */
        int src1 = func_0208e0a0();
        func_02094550(base + 0x50d8,
                      (void *)(src1 + (off / 8) * 0x40),
                      a * 2);
        {
            int src2 = func_0208e0a0();
            func_02094550((void *)(base + 0x50d8 + a * 2),
                          (void *)src2,
                          (((off - 0xd0) * 0x20) / 8) * 2);
        }
        return 0;
    }
}
