/* CAMPAIGN-PREP candidate for func_021c9504 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch loads word per case, returns :id(13b) lsl#19;lsr#19; default eq-chain selects cd4b8/cd4cc then loads+extracts
 *   risk:       struct-guessed: batch asm is TRUNCATED at the default s<=10 case (ends mid-`mla`), so that branch's load/extract is inferred from 021c93f0+021c9650; the s<=10 tail and whether it returns address vs id is the prime divergence. Also case-order/cmpeq-chain like 021c93f0.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_021c9504 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. ASM TRUNCATED in batch at the default<=10
 * tail; default body reconstructed from sibling 021c93f0 (same family).
 *   recipe:     switch(k-0xb): load *(rec+off+idx*4), return .id(13b) via lsl#19;lsr#19; default loads cd4b8/cd4cc and extracts
 * Same dispatch/offsets as 021c93f0 but each case LOADS the word then returns its
 * 13-bit id. Default else (s>10) loads *(eq?cd4b8:cd4cc) and extracts id. */

extern char data_ov002_022cf16c[];
extern char data_ov002_022cd3f4[];
extern char data_ov002_022cd4b8[];
extern char data_ov002_022cd4cc[];

typedef struct { unsigned int id : 13; } Ent9504;

int func_ov002_021c9504(int a, int k, int idx) {
    char *rec = data_ov002_022cf16c + (a & 1) * 0x868;
    switch (k - 0xb) {
        case 0: return (int)((Ent9504 *)(rec + 0x120 + idx * 4))->id;
        case 1: return (int)((Ent9504 *)(rec + 0x3a0 + idx * 4))->id;
        case 2: return (int)((Ent9504 *)(rec + 0x260 + idx * 4))->id;
        case 3: return (int)((Ent9504 *)(rec + 0x418 + idx * 4))->id;
        case 4: return (int)((Ent9504 *)(rec + 0x5d0 + idx * 4))->id;
        default: {
            int s = k + idx;
            if (s <= 10) return (int)((Ent9504 *)(rec + 0x30 + s * 0x14))->id;
            {
                char *q;
                if (a == *(int *)data_ov002_022cd3f4 &&
                    k == *(int *)(data_ov002_022cd3f4 + 0x1c))
                    q = data_ov002_022cd4b8;
                else
                    q = data_ov002_022cd4cc;
                return (int)((Ent9504 *)q)->id;
            }
        }
    }
}
