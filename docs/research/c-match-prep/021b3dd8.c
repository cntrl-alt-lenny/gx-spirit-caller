/* CAMPAIGN-PREP candidate for func_021b3dd8 (ov010, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     result/acc in named locals; seed local=data_8db4 for &out-param; switch w/ dead case3; (u16)acc
 *   risk:       result(r4)/base(r5)/acc(r6) want specific callee-saved regs; mwcc's allocation of the switch-case call results and the held data_8db4/data_8d44 bases may rotate r4-r6. reshape-able partly (decl-order result-before-acc, seed local at decl) but the post-call reg-alloc is a coin-flip; verify, else permuter.
 *   confidence: med
 */
/* func_ov010_021b3dd8 (ov010, class C): dispatch + accumulate, call-result reg-alloc.
 * r4=result(0 unless a switch case sets it), r6=accumulator, both callee-saved.
 * The early `local = data_8db4` seeds the out-param slot passed to 021b3168
 * (&local). Switch on data_8d08[0x3c]: 1->021b5d88, 2->021b7eac (each -> result),
 * 3/default fall through. If acc>0: func_0207f05c(data_8d44+4, data_8db4,(u16)acc).
 * If result==1: data_8d08[0xa4]=data_8d08[0xa0]=0x14000. Returns result. */

extern char data_ov010_021b8d08[];
extern char data_ov010_021b8d44[];
extern char data_ov010_021b8d48[];
extern char data_ov010_021b8db4[];

extern void func_0207ec68(void *a);
extern void func_0207ed94(void *a);
extern void func_0207f05c(void *a, void *b, unsigned int c);
extern int  func_ov010_021b3168(void *out, int b, int c);
extern int  func_ov010_021b5d88(void);
extern int  func_ov010_021b7eac(void);

int func_ov010_021b3dd8(void) {
    int result = 0;
    int acc = 0;
    int local = (int)data_ov010_021b8db4;

    func_0207ed94(data_ov010_021b8d48);
    func_0207ec68(data_ov010_021b8d48);

    acc += func_ov010_021b3168(&local, 0, *(int *)(data_ov010_021b8d08 + 0x9c));

    switch (*(int *)(data_ov010_021b8d08 + 0x3c)) {
    case 1:
        result = func_ov010_021b5d88();
        break;
    case 2:
        result = func_ov010_021b7eac();
        break;
    case 3:
    default:
        break;
    }

    if (acc > 0) {
        func_0207f05c(data_ov010_021b8d44 + 4, data_ov010_021b8db4,
                      (unsigned short)acc);
    }

    if (result == 1) {
        *(int *)(data_ov010_021b8d08 + 0xa4) = 0x14000;
        *(int *)(data_ov010_021b8d08 + 0xa0) = 0x14000;
    }

    return result;
}
