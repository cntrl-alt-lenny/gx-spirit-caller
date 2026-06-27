/* CAMPAIGN-PREP candidate for func_021c2f24 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     13-bit :id bitfield forces lsl#19;lsr#19; parity*0x868 record; rec+0x14 bound; cmp-eq count++
 *   risk:       reshape-able: orig holds rec+0x418 ptr in lr across loop and uses `cmp tag, id` (tag first picks dest); if mwcc reloads base or flips cmp operands, lr/cmpcc diverge. struct-guessed: 0x418/0x14 offsets.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021c2f24 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED: MED tier rarely first-build-matches.
 *   recipe:     13-bit id bitfield (lsl#19;lsr#19); parity*0x868 record; rec[0x14] loop count; if-cmp count++
 *   risk:       see structured risk field.
 * func_021c2f24(parity, tag): guard *(cf180+parity*0x868)!=0; over rec[0x14]
 * entries at rec+0x418, count those whose .id(13b)==tag. cf180 confirmed the
 * per-player count guard (sibling 0220af00 indexes cf17c+ (b0&1)*0x868). */

extern char data_ov002_022cf16c[];   /* record array base, 0x868 stride */
extern char data_ov002_022cf180[];   /* parallel per-player guard/count */

typedef struct { unsigned int id : 13; } Ent2f24;   /* word at rec+0x418+i*4 */

int func_ov002_021c2f24(int parity, int tag) {
    int off = (parity & 1) * 0x868;
    if (*(int *)(data_ov002_022cf180 + off) == 0) return 0;
    {
        char *rec = data_ov002_022cf16c + off;
        Ent2f24 *p = (Ent2f24 *)(rec + 0x18 + 0x400);
        int n = *(int *)(rec + 0x14);
        int count = 0;
        int i = 0;
        do {
            if ((int)p->id == tag) count++;
            i++;
            p++;
        } while (i < n);
        return count;
    }
}
