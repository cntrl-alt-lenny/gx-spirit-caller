/* CAMPAIGN-PREP candidate for func_02014b28 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     0x8d8 :1 bitfield guard; 0x920==1 gate; 0x924 cmp/beq chain (1 falls to 3); unsigned ldmcc; (x&~1)|1
 *   risk:       reshape-able: dispatch is cmp;beq chain NOT a jump-table, so use explicit if(s==1)/else if(s==2)/else if(s==3) (goto for the 1->3 fallthrough) — a switch may emit addls and diverge. func_020195ec eq/ne stores stay predicated.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02014b28 (main, class D, MED tier) — prep batch p_0147.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * Drop into src/main/, run ninja + objdiff, then apply the risk note below.
 * COMPLETE asm (literal pool present). recipe: :1 bitfield guard (0x8d8 bit0) + 0x920==1 gate +
 * 0x924 cmp/beq chain (1/2/3; case1 sets 924=3 falls into case3); unsigned ldmcc early-return
 * (func_02019034 < [0x8dc]+1); (x&~1)|1 for bic;orr; func_020195ec ldreq/ldrne o[8] pair.
 */
extern char *GetSystemWork(void);
extern int  func_02019034(void);
extern int  func_020195ec(void);
extern int  func_0201b7e0(void *);

struct Flag { unsigned int b0 : 1; };

void func_02014b28(void *o) {
    char *w = GetSystemWork();
    if (((struct Flag *)(w + 0x8d8))->b0 == 0) return;
    if (*(int *)(w + 0x920) != 1) return;
    {
        int s = *(int *)(w + 0x924);
        if (s == 1) {
            *(int *)(w + 0x924) = 3;
            goto step3;
        } else if (s == 2) {
            goto step2;
        } else if (s == 3) {
            goto step3;
        }
        return;
    }
step3:
    if (func_0201b7e0(o) != 4) return;
    if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(w + 0x8dc) + 1)) return;
    *(int *)((char *)o + 8) = 0x000b0100;
    *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
    return;
step2:
    if (((struct Flag *)(w + 0x8e0))->b0) return;
    if (func_020195ec() == 0)
        *(int *)((char *)o + 8) = 0x000b0102;
    else
        *(int *)((char *)o + 8) = 0x000b0101;
    return;
}
