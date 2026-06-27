/* CAMPAIGN-PREP candidate for func_020639c8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind self in r6; reverse do-while inner; outer restart; halfword fc/field_66; add base+f0 inline
 *   risk:       reshape-able: inner reload of self->field_5c each pass vs hoist (orig reloads inside both loop heads). If mwcc hoists field_5c to a reg, ldr count diverges; move read inside loops.
 *   confidence: med
 */
// func_020639c8 — main, cls C (two nested scan loops, struct compares)
// r6 = self* (bound across whole fn). Outer loop restarts (b .L_8).
// Inner: reverse counted i from count-1 down (subs r5; bmi/bpl).
typedef struct Self Self;
typedef struct Elem Elem;
struct Elem {
    int f0;   // [+0x00]
    int f4;   // [+0x04]
    int f8;   // [+0x08]
    char _c[2];
    unsigned short fc;   // [+0x0c] halfword
};
struct Self {
    char _44[0x44];
    int field_44;  // [+0x44]
    char _48[0x14];
    int field_5c;  // [+0x5c]
    char _60[0x6];
    unsigned short field_66; // [+0x66]
};
extern int func_02054140(int list);            // count
extern Elem *func_020540d0(int list, int i);    // element at i
extern int func_02063ca4(Self *self, int a, int b, int c);
extern int func_02063a4c(Self *self, Elem *e, int i);
extern int func_020639c8(Self *self);

extern int func_020639c8(Self *self) {
    int i;
    for (;;) {
        i = func_02054140(self->field_5c) - 1;
        if (i < 0)
            return 1;
        do {
            Elem *e = func_020540d0(self->field_5c, i);
            if (e->fc == self->field_66) {
                if (func_02063ca4(self, self->field_44 + e->f0, e->f8, e->f4) == 0)
                    return 0;
                func_02063a4c(self, e, i);
                goto restart;
            }
        } while (--i >= 0);
        return 1;
    restart: ;
    }
}
