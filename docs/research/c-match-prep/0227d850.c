/* CAMPAIGN-PREP candidate for func_0227d850 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     shifted-or operand-first (lo|hi<<8); (u16) cast=>lsl16/lsr16; early-return -1
 *   risk:       mid-fn `if(r<0)return -1` is fused predicated pop (mvnlt;ldmltia); mwcc may branch to a shared epilogue instead of predicating. reshape-able
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0227d850 (ov002, class D, MED tier) — brief 0080.
 * UNVERIFIED + ITERATION-EXPECTED. Drop into src/, run ninja + objdiff, apply risk note.
 *   recipe:     byte-pack (lo)|(hi<<8) shifted-or operand-first; (u16) cast => lsl16/lsr16; early return -1 (full word)
 *   confidence: med
 */
/* func_ov002_0227d850 (cls D) — near-clone of d684. n=1-a; r=cdc0(n,c,0);
 * if(r>=0) return u16((n&0xff)|((r&0xff)<<8)); r=d0ac(a,c,0);
 * if(r<0) return -1; return u16((a&0xff)|((r&0xff)<<8)). arg b (r1) unused. */

extern int func_ov002_0228cdc0(int a, int b, int c);
extern int func_ov002_0228d0ac(int a, int b, int c);

int func_ov002_0227d850(int a, int b, int c) {
    int n = 1 - a;
    int r = func_ov002_0228cdc0(n, c, 0);
    if (r >= 0)
        return (unsigned short)((n & 0xff) | ((r & 0xff) << 8));
    r = func_ov002_0228d0ac(a, c, 0);
    if (r < 0)
        return -1;
    return (unsigned short)((a & 0xff) | ((r & 0xff) << 8));
}
