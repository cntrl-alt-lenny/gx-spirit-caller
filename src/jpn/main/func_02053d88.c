/* CAMPAIGN-PREP candidate for func_02053d88 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     signed bounds assert idx<0||idx>=*self (two-branch bmi+blt, NOT unsigned single-cmp); movs r2 sets flags; calls in order 02054314 then 0205428c
 *   risk:       `movs r4,r2; bmi` then `cmp r4,*self; blt ok` is a signed two-test; if written unsigned `(u32)idx>=(u32)count` mwcc emits ONE cmp and the bmi disappears. reshape-able (keep signed `if (idx<0 || idx>=self->count)`)
 *   confidence: med
 */
/* func_02053d88: bounds-check then two ops. r0=self, r1=arg1, r2=idx.
 * _LIT0=data_020ffa30 (file), _LIT1=data_020ffa24 (msg). Assert if OOB.
 */

extern char data_020ffa24;
extern char data_020ffa30;
extern void func_020a6c60(void *file, void *msg, int line, int code);
extern void func_020542a0(void *self, int idx);
extern void func_02054218(void *self, int arg1, int idx);

struct Self { int count; };

void func_02053d88(struct Self *self, int arg1, int idx) {
    if (idx < 0 || idx >= self->count)
        func_020a6c60(&data_020ffa30, &data_020ffa24, 0, 0xd3);

    func_020542a0(self, idx);
    func_02054218(self, arg1, idx);
}
