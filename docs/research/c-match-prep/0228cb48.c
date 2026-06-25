/* CAMPAIGN-PREP candidate for func_0228cb48 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class C/D: bitscan values 0..10 at base sel<<4 into int[11]; out[count++] (predicated); 021b00d0 pick; -1 via mvn
 *   risk:       orig inducts the absolute shift (lr+=1, 1<<lr); (1<<(base+v)) may make mwcc recompute base+v not induct it. reshape-able: keep a running shift var; out[count++] strne/addne should match.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0228cb48 (ov002, class C/D, MED tier) — brief 0113.
 * UNVERIFIED + ITERATION-EXPECTED. Cleanest loop in the batch.
 *   recipe:     Class C/D: collect set bits (values 0..10) of mask at bit base sel<<4 into int[11]; conditional out[count++]=v (strne+addne); pick via 021b00d0(count); count<=0 -> -1 (mvn)
 *   risk:       orig keeps the absolute bit position as a loop-carried shift (lr += 1, tst r1, 1<<lr) rather than recomputing (base+v). Writing (1 << (base+v)) may make mwcc recompute the shift instead of inducting it. reshape-able: maintain a running `bit`/shift variable; the strne/addne predication of out[count++] should match as written.
 *   confidence: med
 */
extern unsigned int func_ov002_021b00d0(unsigned int count);

int func_ov002_0228cb48(int sel, int mask) {
    int out[11];
    int count = 0;
    int v;
    int base = sel << 4;
    for (v = 0; v <= 10; v++) {
        if (mask & (1 << (base + v)))
            out[count++] = v;
    }
    if (count <= 0) return -1;
    return out[func_ov002_021b00d0(count)];
}
