/* CAMPAIGN-PREP candidate for func_021bd200 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla-base; two-ptr walk; id!=0&&cap!=0 fused; tst #0x46 early-return-0; arg0 held in r7
 *   risk:       arg0 saved to r7 and reused as call arg each iter; if mwcc reloads vs holds it the call-site mov diverges, plus the tst#0x46 must stay a tst (mask test) not and+cmp. reshape-able (bind arg0; keep `&0x46` in if).
 *   confidence: med
 */
/* func_ov002_021bd200: scan 5 slots of player (arg0&1); for the first slot whose
 * id!=0 and cap(+0x38)!=0, call func_ov002_021c92fc(arg0,i); if (ret & 0x46)
 * return 0. if no slot triggers a failure, return 1. */
extern unsigned char data_ov002_022cf16c[];
extern int func_ov002_021c92fc(int a, int b);
struct slot { unsigned int id : 13; };

int func_ov002_021bd200(int arg0) {
    unsigned char *rec = data_ov002_022cf16c + (arg0 & 1) * 0x868;
    unsigned char *row = rec + 0x30;
    int i;
    for (i = 0; i < 5; i++) {
        if (((struct slot *)row)->id != 0 && *(unsigned short *)(rec + 0x38) != 0) {
            if (func_ov002_021c92fc(arg0, i) & 0x46)
                return 0;
        }
        row += 20;
        rec += 20;
    }
    return 1;
}
