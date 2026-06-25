/* CAMPAIGN-PREP candidate for func_02063ed0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard if-chain; func_020643d8(0) first two, (self) third; halfword field_4; 3 stack args store-order
 *   risk:       struct-guessed: ((int*)self->field_8)[8] models 'ldr r0,[r0,#0x20]' via self->field_8 deref; if field_8 is a typed struct ptr the offset is right but type wrong. Also stack-arg eval order (t,b+0x20,c-0x20) must match str sp/sp+4/sp+8.
 *   confidence: low
 */
// func_02063ed0 — main, cls C (multi-guard, struct loads/stores, several returns)
// r6=self*, r5=arg b, r4=arg c (int). func_020628fc/func_02061fa4(self).
// Tail: func_02061d5c(self, self->f8?, self->f0, hword self->f4, [sp args]).
typedef struct Self Self;
struct Self {
    int field_0;   // [+0x00]
    unsigned short field_4; // [+0x04] halfword
    char _6[2];
    int field_8;   // [+0x08]
    int field_c;   // [+0x0c]
    char _10[0x58];
    int field_68;  // [+0x68]
    char _6c[0x20];
    int field_8c;  // [+0x8c]
};
extern int  func_020643d8(Self *self_or_zero);
extern int  func_02060fdc(int b, int *region);
extern int  func_020628fc(Self *self);
extern void func_02061fa4(Self *self);
extern int  func_02055330(void);
extern int  func_02061d5c(Self *self, void *p0, int p2, int p3, int s0, int s1, int s2);
extern int  func_02063ed0(Self *self, int b, int c);

extern int func_02063ed0(Self *self, int b, int c) {
    if (self->field_c != 3)
        return func_020643d8(0) != 0 ? 1 : 0;
    if (c < 0x20)
        return func_020643d8(0) != 0 ? 1 : 0;
    if (func_02060fdc(b, &self->field_68) == 0)
        return func_020643d8(self) != 0 ? 1 : 0;
    if (((int *)self->field_8)[0x20 / 4] == 0) {
        if (func_020628fc(self) == 0)
            return 0;
        func_02061fa4(self);
        return 1;
    }
    self->field_c = 4;
    {
        int t = func_02055330() - self->field_8c;
        int r = func_02061d5c(self, (void *)self->field_8, self->field_0,
                              self->field_4,
                              t, b + 0x20, c - 0x20);
        return r != 0 ? 1 : 0;
    }
}
