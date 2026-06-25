/* CAMPAIGN-PREP candidate for func_021c9bc8 (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     void; bind co(r9)/by(r6)/ci(r8)/bx(r7); span via +0x13 guards; stmia out on hit
 *   risk:       hit path stmleia r3,{r0,r4,r5} bundles {1,inner,outer} as one store; mwcc only fuses it if out[0..2] are sequential int* writes — it should, but a movle-predicated form vs branch may diverge. struct-guessed (out triple) + reshape-able.
 *   confidence: med
 */
/* func_ov006_021c9bc8: locate which [0x7c]x[0x78] cell (origin grids at +0x8c/+0x88,
   step 0x14, span 0x14) contains point (x,y); write {hit, innerIdx, outerIdx} via
   out (r3), or {0} if none. */
void func_ov006_021c9bc8(char *base, int x, int y, int *out) {
    int oi, ii;
    int co = *(int *)(base + 0x7c);
    if (co > 0) {
        int by = *(int *)(base + 0x8c);
        for (oi = 0; oi < co; oi++, by += 0x14) {
            if (y < by) continue;
            if (y > by + 0x13) continue;
            {
                int ci = *(int *)(base + 0x78);
                int bx;
                if (ci <= 0) continue;
                bx = *(int *)(base + 0x88);
                for (ii = 0; ii < ci; ii++, bx += 0x14) {
                    if (x < bx) continue;
                    if (x <= bx + 0x13) {
                        out[0] = 1;
                        out[1] = ii;
                        out[2] = oi;
                        return;
                    }
                }
            }
        }
    }
    out[0] = 0;
    return;
}
