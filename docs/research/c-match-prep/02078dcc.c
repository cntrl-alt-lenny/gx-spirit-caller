/* CAMPAIGN-PREP candidate for func_02078dcc (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     &0xff masks => and; S=st+2 base + i/j hoisted before loop; store S[i]=sj before S[j]=si; eor data-first
 *   risk:       permuter-class: loop body register allocation across i/j/si/sj/S — mwcc may rotate which regs hold i vs j (orig keeps i in lr, j in ip) causing a scheduling/reg coin-flip the C shape won't pin.
 *   confidence: med
 */
/* func_02078dcc: RC4 PRGA. r0=state (i at [0], j at [1], 256-byte S-box at
 * [2]), r1=data buffer, r2=len. i/j loaded once, kept in regs across the loop
 * and written back. Per byte: i=(i+1)&255; swap S[i],S[j=(j+S[i])&255];
 * data[k]^=S[(S[i]+S[j])&255]. Stores S[i]=sj then S[j]=si (asm order). */
void func_02078dcc(unsigned char *st, unsigned char *data, int len) {
    unsigned char *S = st + 2;
    int i = st[0];
    int j = st[1];
    int k;
    for (k = 0; k < len; k++) {
        unsigned int si, sj;
        i = (i + 1) & 0xff;
        si = S[i];
        j = (j + si) & 0xff;
        sj = S[j];
        S[i] = sj;
        S[j] = si;
        data[k] ^= S[(si + sj) & 0xff];
    }
    st[0] = i;
    st[1] = j;
}
