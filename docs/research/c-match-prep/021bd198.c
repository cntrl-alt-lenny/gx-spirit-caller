/* CAMPAIGN-PREP candidate for func_021bd198 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla-base; two-ptr walk; id!=0 && cap!=0 fused (movs;ldrneh;cmpne); leaf call
 *   risk:       func_0202e310 arg count is inferred (asm passes nothing fresh in r0-r3 before bl, so r0 carries last slot ptr). struct-guessed: confirm callee signature/args; if it takes args the call-site regs differ.
 *   confidence: med
 */
/* func_ov002_021bd198: scan 5 slots of player (arg0&1); for the first slot whose
 * id!=0 and cap(+0x38)!=0, return 1 if func_0202e310() (no args observed) is
 * nonzero; else continue. return 0 if none. arg0 stays in r0 for the call. */
extern unsigned char data_ov002_022cf16c[];
extern int func_0202e310(void);
struct slot { unsigned int id : 13; };

int func_ov002_021bd198(int arg0) {
    unsigned char *rec = data_ov002_022cf16c + (arg0 & 1) * 0x868;
    unsigned char *row = rec + 0x30;
    int i;
    for (i = 0; i < 5; i++) {
        if (((struct slot *)row)->id != 0 && *(unsigned short *)(rec + 0x38) != 0) {
            if (func_0202e310() != 0)
                return 1;
        }
        row += 20;
        rec += 20;
    }
    return 0;
}
