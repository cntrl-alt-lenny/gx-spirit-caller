/* CAMPAIGN-PREP candidate for func_021c93f0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch(k-0xb) jump-table; each case mla rec base + idx*4; default sum-gate s*0x14 or eq-chain static ptr
 *   risk:       reshape-able: each case is `mla r1,parity,0x868,cf16c` then `add #off; add r2<<2` — case order must lay the table b/k order; default `cmpeq` chain (a==cd3f4[0] && k==cd3f4[0x1c]) must stay a predicated chain, not branches. struct-guessed: sub-array offsets + 0x14 stride.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021c93f0 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Signature confirmed by siblings (021d0e18,
 * 02214d74): func_021c93f0(int a, int k, int idx) -> entry address.
 *   recipe:     switch(k-0xb) returns &rec[off]+idx*4 via mla base; default = sum-gate -> rec+0x30+sum*0x14 or static ptr
 * Dispatch k-0xb in 0..4 -> sub-array offsets {0x120,0x3a0,0x260,0x418,0x5d0};
 * returns address rec + off + idx*4. Default (k out of range): s=k+idx; if s<=10
 * return rec+0x30 + s*0x14; else if (a==cd3f4[0] && k==cd3f4[0x1c]) return
 * &cd4b8 else &cd4cc. rec = cf16c + (a&1)*0x868. */

extern char data_ov002_022cf16c[];
extern char data_ov002_022cd3f4[];
extern char data_ov002_022cd4b8[];
extern char data_ov002_022cd4cc[];

void *func_ov002_021c93f0(int a, int k, int idx) {
    char *rec = data_ov002_022cf16c + (a & 1) * 0x868;
    switch (k - 0xb) {
        case 0: return rec + 0x120 + idx * 4;
        case 1: return rec + 0x3a0 + idx * 4;
        case 2: return rec + 0x260 + idx * 4;
        case 3: return rec + 0x18 + 0x400 + idx * 4;
        case 4: return rec + 0x5d0 + idx * 4;
        default: {
            int s = k + idx;
            if (s <= 10) return rec + 0x30 + s * 0x14;
            if (a == *(int *)data_ov002_022cd3f4 &&
                k == *(int *)(data_ov002_022cd3f4 + 0x1c))
                return data_ov002_022cd4b8;
            return data_ov002_022cd4cc;
        }
    }
}
