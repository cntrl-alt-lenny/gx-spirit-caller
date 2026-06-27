/* CAMPAIGN-PREP candidate for func_021cbf28 (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     dx/dy deltas; 3-bit field; {&pair,0} frame; abs via movge/rsblt; smull-magic /K; sign-branch +/-0x4000
 *   risk:       permuter-class: dual sign-branch abs() feeding twin smull-magic blocks + per-branch +/-0x4000 coin-flip; lr/ip/r5 rotation won't match. Tail TRUNCATED + magic divisor unknown (struct-guessed)
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov011_021cbf28 (ov011, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED: MED tier rarely first-build-matches; the asm body
 * is TRUNCATED in the batch (ends at movs r5,r0,asr#0xc) -- tail logic is unknown.
 *   recipe:     deltas dx=B[0x26c]-B[0x238], dy=B[0x270]-B[0x23c]; 3-bit field B[0x27c]; build {&pair,0} stack frame; sign-branch with abs() via movge/rsblt; smull-magic /K
 *   risk:       permuter-class: dual sign-branch (cmp x,0; movge lr,x; rsblt lr,-x = abs) feeding identical smull-magic blocks, plus the r0 +/-0x4000 coin-flip per branch; reg rotation (lr/ip/r5) won't match. Also TRUNCATED tail + magic divisor (_LIT2) unknown = struct-guessed.
 *   confidence: low
 */
/* func_ov011_021cbf28 (ov011, class D, base B=data_4000): dx=B[0x26c]-B[0x238];
 * dy=B[0x270]-B[0x23c]; sel=(B[0x27c]<<29)>>29 (3-bit). local pair{dx,dy};
 * func_ov011_021cbb64(sel, &{&pair,0}, ... , 2, 0x1a) [stack: &pair,0,0; r1=-1].
 * if (sel-1)>1u return. Then with v1=B[0x248] fields, v0=B[0x250]: a=abs(s16 hi-lo);
 * if a<0x8000 vs >= : nudge v0 by +/-0x4000, optionally += abs(d)*magic/K. tail truncated. */
extern char data_ov011_021d4000[];
extern void func_ov011_021cbb64(int r0, int *r1, int r2, int r3);

int func_ov011_021cbf28(void) {
    char *B = data_ov011_021d4000;
    int frame[3];
    int pair[2];
    int sel;
    int v1, v0, lo, hi, d, a;
    pair[0] = *(int *)(B + 0x26c) - *(int *)(B + 0x238);
    pair[1] = *(int *)(B + 0x270) - *(int *)(B + 0x23c);
    sel = (int)((unsigned int)(*(int *)(B + 0x27c) << 29) >> 29);
    frame[0] = (int)pair;
    frame[1] = 0;
    frame[2] = 0;
    func_ov011_021cbb64(sel, frame, 2, 0x1a);
    if ((unsigned int)(sel - 1) > 1u)
        return 0;
    v1 = *(int *)(B + 0x248);
    v0 = *(int *)(B + 0x250);
    lo = (v1 << 16) >> 16;
    hi = v1 >> 16;
    d = lo - hi;
    a = d >= 0 ? d : -d;
    if (a < 0x8000) {
        if (d > 0) {
            if (v0 == 0) {
                int m = d >= 0 ? d : -d;
                /* MAGIC DIVIDE: real divisor is _LIT2 (unknown); 0x100 placeholder */
                v0 += (m << 21) / 0x100;
            }
            v0 += 0x4000;
        } else {
            v0 -= 0x4000;
        }
    } else {
        if (d > 0) {
            if (v0 == 0) {
                int m = d >= 0 ? d : -d;
                v0 -= (m << 21) / 0x100;
            }
            v0 -= 0x4000;
        } else {
            v0 += 0x4000;
        }
    }
    return v0 >> 12;
}
