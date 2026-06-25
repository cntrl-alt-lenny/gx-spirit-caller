/* CAMPAIGN-PREP candidate for func_02082494 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     idx<<1 bound across loop, *out=0 first, blx if-bit, OR-accumulate, walk ->0x10
 *   risk:       reshape-able: trailing 'mov r0,r8(=1)' suggests the original returns 1 (an int) not void; if objdiff shows a stray r0=1, change signature to 'int' returning 1.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02082494 (main, class C) - p_0033.
 * UNVERIFIED build-free draft: drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe: idx2=arg2<<1 bound across loop; *out=0 first; per-node blx if(h&0x100); *out |= local; walk ->0x10
 */
/* func_02082494: linked-list walk; for each node whose attr halfword (at
 * idx*2 + 0x1a) has bit 0x100, invoke node->vtbl(&local, node, attr&0xff)
 * and OR the produced value into *out. */

void func_02082494(int *out, unsigned char *node, int idx) {
    int local;
    int idx2 = idx << 1;
    *out = 0;
    while (node != 0) {
        unsigned short h = *(unsigned short *)(node + idx2 + 0x1a);
        if (h & 0x100) {
            void (*cb)(int *, void *, int) = *(void (**)(int *, void *, int))(node + 0xc);
            cb(&local, node, h & 0xff);
            *out = *out | local;
        }
        node = *(unsigned char **)(node + 0x10);
    }
}
