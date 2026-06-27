/* CAMPAIGN-PREP candidate for func_02014814 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     0x8d8 :1 bitfield guard; 0x920==1 gate; 0x924 jump-table; func_020195ec ldreq/ldrne o[8] pair; (x&~1)|1
 *   risk:       reshape-able: the func_020195ec eq/ne result must stay predicated (ldreq/streq + ldrne/strne) — keep it as if-else over the same o[8] slot, not a branch; else stores diverge. Jump-table layout may still flip (permuter-class fallback).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02014814 (main, class D, MED tier) — prep batch p_0147.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * Drop into src/main/, run ninja + objdiff, then apply the risk note below.
 * COMPLETE asm (literal pool present). recipe: :1 bitfield guard (0x8d8 bit0) + 0x920==1 gate +
 * 0x924 addls jump-table (case1 sets 924=4 falls into case4); ldreq/ldrne predicated o[8] store
 * pair from func_020195ec result; (x&~1)|1 for bic;orr; orr #4 set; bind work base once.
 */
extern char *GetSystemWork(void);
extern int  func_02019034(void);
extern int  func_020195ec(void);
extern int  func_02019664(void);
extern int  func_ov000_021ae4ac(void);

struct Flag { unsigned int b0 : 1; };

void func_02014814(void *o) {
    char *w = GetSystemWork();
    if (((struct Flag *)(w + 0x8d8))->b0 == 0) return;
    if (*(int *)(w + 0x920) != 1) return;
    switch (*(int *)(w + 0x924)) {
    case 1:
        *(int *)(w + 0x924) = 4;
        /* fallthrough */
    case 4:
        if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(w + 0x8dc) + 1)) return;
        if (func_02019664() != 0x6c) return;
        *(int *)((char *)o + 8) = 0x00090100;
        *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
        return;
    case 3:
        if (func_ov000_021ae4ac() != 2) {
            if (((struct Flag *)(w + 0x8e0))->b0) return;
            if (func_020195ec() == 0)
                *(int *)((char *)o + 8) = 0x00090101;
            else
                *(int *)((char *)o + 8) = 0x00090102;
            return;
        }
        *(int *)(w + 0x91c) = 0xa;
        *(int *)(w + 0x920) = 1;
        *(int *)(w + 0x924) = 1;
        *(int *)(w + 0x8e0) |= 4;
        return;
    case 2:
        *(int *)((char *)o + 8) = 0x00090103;
        return;
    }
}
