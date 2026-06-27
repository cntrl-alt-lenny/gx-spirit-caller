/* CAMPAIGN-PREP candidate for func_0200620c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit1 :1 bitfield guard (proven func_02006148); bic 0x3fffffff mask; cmp>=2->1
 *   risk:       reshape-able: the asm holds &data_02103c94 in r0 across both the [0x28] read and the [0x20] read (one literal load, two ldr). If mwcc reloads the base for field20, an extra ldr literal diverges. The movge tail wants if(...>=2)return 1; not a bool cast; keep nested-if form.
 *   confidence: med
 */
/* func_0200620c: test bit1 of data_02103c94[0x28]; if set, call
 * func_020061a0(low30 of [0x20]) and return (result>=2). Else 0.
 * Bitfield read identical to matched func_02006148 (bit_1).
 *
 *   ldr r0,=d74; ldr r1,[r0,#0x28]; lsl#0x1e; lsrs#0x1f; beq ret0
 *   ldr r0,[r0,#0x20]; bic r0,#0xc0000000      ; clear top 2 bits
 *   func_020061a0(r0); cmp #2; movge r0,#1; return
 */

typedef struct {
    char         _pad_00[0x20];
    unsigned int field20;          /* +0x20 */
    char         _pad_24[0x4];     /* +0x24 */
    unsigned int _b0  : 1;         /* +0x28 */
    unsigned int bit1 : 1;
    unsigned int _hi  : 30;
} state_02103d74_t;

extern state_02103d74_t data_02103c94;
extern int func_020061a0(unsigned int x);

int func_0200620c(void) {
    if (data_02103c94.bit1) {
        if (func_020061a0(data_02103c94.field20 & 0x3fffffff) >= 2) {
            return 1;
        }
    }
    return 0;
}
