/* CAMPAIGN-PREP candidate for func_022172f0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     cd420 player*0x38 record bind once; slot via mul 0x14 (not mla); recon = (hi<<1)|bit via add
 *   risk:       recon uses two raw asymmetric shifts of the SAME slot word fed to add r3,r3,ip,lsr#0x1f; mwcc may CSE the slot load differently or fold the (slot<<2)>>24<<1 into one shift. reshape-able (keep two separate unsigned shift temps, no parens-merge).
 *   confidence: low
 */
/* func_ov002_022172f0: from cd420[active-player*0x38]: if +0x2c==0, decode a slot id
 * via cf16c[(s0&1)*0x868 + s4*0x14 + 0x30] and compare a reconstructed 9-bit value
 * against +0xc; on equal, call 021de910. ret 0. */
#include "ov002_core.h"
extern char data_ov002_022cd420[];
extern void func_ov002_021de910(void);

int func_ov002_022172f0(void) {
    int player = *(int *)(data_ov002_022d016c + 0xcec);
    char *rec = data_ov002_022cd420 + player * 0x38;
    if (*(int *)(rec + 0x2c) == 0) {
        int s0 = *(int *)rec;
        int s4 = *(int *)(rec + 0x4);
        unsigned int slot = *(unsigned int *)(data_ov002_022cf16c + (s0 & 1) * 0x868 + s4 * 20 + 0x30);
        int recon = ((slot << 2) >> 0x18 << 1) + ((slot << 0x12) >> 0x1f);
        if (*(int *)(rec + 0xc) == recon) {
            func_ov002_021de910();
        }
    }
    return 0;
}
