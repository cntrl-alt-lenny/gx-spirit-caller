/* CAMPAIGN-PREP candidate for func_020a3a2c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     r=1 default; bind *data_021a98f8 for first reads then reload for the f526=1 store; pass fn-ptr arg
 *   risk:       permuter-class: r5 holds r(=1/0/call-ret) and r4 the saved IRQ mask across both calls; this callee-saved pairing is a coin-flip. struct-guessed f526/f5e4 offsets.
 *   confidence: med
 */
/* func_020a3a2c (main, class C) — IRQ-bracketed one-shot arm: if not already
 * armed, clear a field, set the armed flag, then either register a callback
 * (return 0) or run an alternate init (return its result).
 *   no incoming args (operates on global *data_021a98f8)
 *
 * asm shape:
 *   saved = OS_DisableIrq();
 *   r = 1;
 *   S *s = *data_021a98f8;                 // bound for first reads
 *   if (s->f526 == 0) {                    // u16 @ 0x500+0x26
 *       s->f5e4 = 0;                        // int @ 0x5e4
 *       (*data_021a98f8)->f526 = 1;         // RELOAD *data_021a98f8 then store
 *       if (func_020a5878() != 0) {
 *           func_020a5668(func_020a3ab4);   // pass function pointer
 *           r = 0;
 *       } else {
 *           r = func_020a3ac0();
 *       }
 *   }
 *   OS_RestoreIrq(saved);
 *   return r;
 */

typedef struct {
    char           _pad000[0x500 + 0x26];
    unsigned short f526;   /* 0x500 + 0x26 */
    char           _pad528[0x5e4 - 0x526 - 2];
    int            f5e4;   /* +0x5e4 */
} a3a2c_state;

extern a3a2c_state *data_021a98f8;

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern int  func_020a5878(void);
extern void func_020a5668(void *cb);
extern int  func_020a3ac0(void);
extern void func_020a3ab4(void);

int func_020a3a2c(void)
{
    int saved = OS_DisableIrq();
    int r = 1;

    if (data_021a98f8->f526 == 0) {
        data_021a98f8->f5e4 = 0;
        data_021a98f8->f526 = 1;
        if (func_020a5878() != 0) {
            func_020a5668((void *)func_020a3ab4);
            r = 0;
        } else {
            r = func_020a3ac0();
        }
    }

    OS_RestoreIrq(saved);
    return r;
}
