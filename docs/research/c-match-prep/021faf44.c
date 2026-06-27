/* CAMPAIGN-PREP candidate for func_021faf44 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield f6@6 guard; store-order fa,f8,fc; bit0 arg; if/else-if state dispatch
 *   risk:       TRUNCATED: state-2 body + LIT0/LIT5 pool cut from the batch -> struct-guessed AND incomplete; will not byte-match as-is. Re-extract full asm before any build.
 *   confidence: low
 */
/* func_ov002_021faf44 (ov002, cls C): 3-state machine. PROLOGUE+STATE0/1 ARE
 * MODELLED FROM ASM; STATE 2 IS TRUNCATED in the batch (asm cut at
 * `mov r3,ip,lsl#2`) and is RECONSTRUCTED-INCOMPLETE -- must be re-derived
 * from full disasm. Guard: 6-bit field@6 of self->f2 == 0x23 -> return 1.
 * self->f0 == LIT0 sets a local kind=3 (else 2) used only in the truncated
 * state-2 tail. Dispatch ce288.f1460 0/1/2/else. */

typedef unsigned short u16;

struct Self21faf44 { u16 f0; u16 b0 : 1; u16 : 5; u16 f6 : 6; u16 f8; u16 fa; u16 fc; };
struct Ce21faf44   { char _a[0x5b4]; int f1460; };

extern struct Ce21faf44 data_ov002_022ce288;
extern char data_ov002_022d016c[];

extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_0225935c(int bit0, int one, char *d016c);
extern int  func_ov002_022593f4(void);

#define LIT0_021faf44 0 /* STRUCT-GUESSED: self->f0 compare constant (pool cut) */

int func_ov002_021faf44(struct Self21faf44 *self) {
    int kind = 2;
    if (self->f6 == 0x23) return 1;
    if (self->f0 == LIT0_021faf44) kind = 3;
    (void)kind; /* consumed in truncated state-2 tail */
    if (data_ov002_022ce288.f1460 == 0) {
        self->fa = 0;
        self->f8 = 0;
        self->fc = 0;
        func_ov002_021ae400(self->b0, 0x12);
        data_ov002_022ce288.f1460++;
        return 0;
    }
    if (data_ov002_022ce288.f1460 == 1) {
        func_ov002_0225935c(self->b0, 1, data_ov002_022d016c);
        data_ov002_022ce288.f1460++;
        return 0;
    }
    if (data_ov002_022ce288.f1460 == 2) {
        if (func_ov002_022593f4() != 0) {
            /* TRUNCATED: mla/orr bit-set + (player&1)*LIT5 base + 0x14/0x28
             * scaled loads. NOT RECOVERABLE from the batch slice. */
        }
        /* trailing state-2 advance/return not shown */
    }
    return 1;
}
