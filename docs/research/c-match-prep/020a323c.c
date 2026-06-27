/* CAMPAIGN-PREP candidate for func_020a323c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: for(;;) switch; explicit case6 to size 0..6 table; g bound, state re-read
 *   risk:       reshape-able: table must be 7-wide (idx6=loop=default). If mwcc folds case6 into default it emits cmp #5 not #6 -> drop/keep case6 to flip. struct-guessed: state@0xc.
 *   confidence: med
 */
/* func_020a323c: for(;;) state-machine over data_021a9850->state (u8@+0xc).
 * 0-based jump table cmp #6; cases 3/5 tail-return, others loop. (class D) */
extern void *func_020a3144(void);
extern void *func_020a2f9c(void);
extern int  func_020a3190(void);
extern void func_020a2fcc(int a, int b, int c);
extern void func_020a2cf8(int a, int b, int c);

struct Sm323c { char _pad[0xc]; unsigned char state; };
extern struct Sm323c *data_021a9850;

void func_020a323c(int a, int b, int c) {
    struct Sm323c *g = data_021a9850;
    for (;;) {
        switch (g->state) {
        case 0:
        case 1:
            if (func_020a3190() == 0)
                return;
            break;
        case 2:
            func_020a3144();
            break;
        case 3:
            func_020a2fcc(a, b, c);
            return;
        case 4:
            func_020a2f9c();
            break;
        case 5:
            func_020a2cf8(a, b, c);
            return;
        case 6:
            break;
        default:
            break;
        }
    }
}
