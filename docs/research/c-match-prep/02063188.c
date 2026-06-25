/* CAMPAIGN-PREP candidate for func_02063188 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     early-return if-chain; func_02064d10 no-arg; 4 stack args; bind ent reloaded as Obj*
 *   risk:       reshape-able: orig re-derives ent->field via fresh ldr each guard (ent not callee-saved-bound after first block); casting (Obj*)ent per-use should match; else decl-order/CSE divergence.
 *   confidence: med
 */
// func_02063188 — main, cls C (multi-branch, stack args, early returns)
// Inferred: r0/r7 = self*, r1/r6 = arg b, r2/r5 = arg c.
// func_02064d10() takes no args (called before any are loaded for it).
// func_02061670(self, ent, b, c, 1,0,0,0) — 4 reg + 4 stack args.
typedef struct Obj Obj;
struct Obj {
    char _0[0xc];
    int field_c;   // [+0x0c]
    char _10[0xc];
    int field_1c;  // [+0x1c]
    int field_20;  // [+0x20]
    char _24[0x8];
    int field_2c;  // [+0x2c]
};
extern int func_02064d10(void);
extern int func_02061670(Obj *a, int ent, int b, int c, int e, int f, int g, int h);
extern int func_020643ec(int ent, int a, int b);
extern int func_02055330(void);
extern int func_02063188(Obj *self, int b, int c);

extern int func_02063188(Obj *self, int b, int c) {
    int ent = func_02064d10();
    if (self->field_2c != 0) {
        if (func_02061670(self, ent, b, c, 1, 0, 0, 0) == 0)
            return 0;
    }
    if (ent == 0)
        return 1;
    if (((Obj *)ent)->field_c == 0) {
        if (((Obj *)ent)->field_20 != 0) {
            if (func_02055330() - ((Obj *)ent)->field_1c >= ((Obj *)ent)->field_20) {
                if (func_020643ec(ent, 6, 1) == 0)
                    return 0;
                return 1;
            }
        }
        return 1;
    }
    if (func_020643ec(ent, 2, 1) == 0)
        return 0;
    return 1;
}
