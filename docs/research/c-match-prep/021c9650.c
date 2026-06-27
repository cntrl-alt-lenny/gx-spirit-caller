/* CAMPAIGN-PREP candidate for func_021c9650 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch loads e per case; key=((e>>6)&0xff)*2+((e>>13)&1) via explicit shifts (same as 021c3008); default eq-chain
 *   risk:       struct-guessed + permuter-class: default tail TRUNCATED in batch (ends at `ldr r3,[r2]`), inferred from siblings; AND the pack `add r0,r0,r1,lsr#0x1f` (*2 + bit13) fusion may not match — inlining pack9650 vs a static call also risks an extra frame. Confirm default + check fusion.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_021c9650 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. ASM TRUNCATED at default tail (ends after
 * `ldr r3,[r2]`); default reconstructed from sibling 021c93f0/021c9504.
 *   recipe:     switch(k-0xb): load e=*(rec+off+idx*4); return ((e>>6)&0xff)*2 + ((e>>13)&1); same pack as 021c3008
 * Each case loads e via [base, idx, lsl#2] and returns the packed 9-bit key. */

extern char data_ov002_022cf16c[];
extern char data_ov002_022cd3f4[];
extern char data_ov002_022cd4b8[];
extern char data_ov002_022cd4cc[];

static int pack9650(unsigned int e) {
    return (int)(((e << 2) >> 24) << 1) + (int)((e << 18) >> 31);
}

int func_ov002_021c9650(int a, int k, int idx) {
    char *rec = data_ov002_022cf16c + (a & 1) * 0x868;
    switch (k - 0xb) {
        case 0: return pack9650(*(unsigned int *)(rec + 0x120 + idx * 4));
        case 1: return pack9650(*(unsigned int *)(rec + 0x3a0 + idx * 4));
        case 2: return pack9650(*(unsigned int *)(rec + 0x260 + idx * 4));
        case 3: return pack9650(*(unsigned int *)(rec + 0x18 + 0x400 + idx * 4));
        case 4: return pack9650(*(unsigned int *)(rec + 0x5d0 + idx * 4));
        default: {
            int s = k + idx;
            if (s <= 10) return pack9650(*(unsigned int *)(rec + 0x30 + s * 0x14));
            {
                char *q;
                if (a == *(int *)data_ov002_022cd3f4 &&
                    k == *(int *)(data_ov002_022cd3f4 + 0x1c))
                    q = data_ov002_022cd4b8;
                else
                    q = data_ov002_022cd4cc;
                return pack9650(*(unsigned int *)q);
            }
        }
    }
}
