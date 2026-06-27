/* CAMPAIGN-PREP candidate for func_021c2f90 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two bitfields (:id 13b, :b21 at bit21); nested if so b21 movs is separate; parity*0x868; rec+0x14 bound
 *   risk:       reshape-able: b21 extract is `lsl#0xa;lsrs#0x1f` (movs) — a `: 1` at bit21 read as `(x<<10)>>31`; if mwcc folds the two ifs into &&, the `bne .L_58` early-out vs single predicated path diverges. Keep nested ifs.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021c2f90 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe:     two bitfields: .id(13b) lsl#19;lsr#19, .b21(bit21) lsl#10;lsr#31; count id==tag && b21==0
 * func_021c2f90(parity, tag): guard; over rec[0x14] entries at rec+0x418, for
 * each whose .id==tag, if its bit21 is clear, count++. Inner test is split
 * (bne skips the bit-test), so b21 read is a separate movs after the id compare. */

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];

typedef struct {
    unsigned int id : 13;   /* bits 0..12 */
    unsigned int _g : 8;    /* bits 13..20 */
    unsigned int b21 : 1;   /* bit 21 */
} Ent2f90;

int func_ov002_021c2f90(int parity, int tag) {
    int off = (parity & 1) * 0x868;
    if (*(int *)(data_ov002_022cf180 + off) == 0) return 0;
    {
        char *rec = data_ov002_022cf16c + off;
        Ent2f90 *p = (Ent2f90 *)(rec + 0x18 + 0x400);
        int n = *(int *)(rec + 0x14);
        int count = 0;
        int i = 0;
        do {
            if ((int)p->id == tag) {
                if (p->b21 == 0) count++;
            }
            i++;
            p++;
        } while (i < n);
        return count;
    }
}
