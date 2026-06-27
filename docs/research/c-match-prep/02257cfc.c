/* CAMPAIGN-PREP candidate for func_02257cfc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :1 bitfields (f4.bit5/bit2/bit3, f2.bit0); bind f4 across both tests; bit3=1 emits orr#8; rsb via 1-bit0; blx fn-ptr at record+4 family form.
 *   risk:       mwcc must CSE the f4 ldrh across the bit5 and bit2 tests (orig holds r2) — likely but not guaranteed. struct-guessed (bitfield packing of f2/f4 + f18 offset). Otherwise reshape-able; the blx form is proven.
 *   confidence: med
 */
/* func_ov002_02257cfc: if self->f4.bit5 and self->f18==0x1975, optionally
 * pulse func_ov002_0226af38(!f2.bit0,1,1) when f4.bit2 is clear, set f4.bit3,
 * return 0. Otherwise resolve via func_ov002_02257464 and tail-blx the fn-ptr
 * at record+4 (or return 0). f4 is read once and held across both bit tests. */

typedef unsigned short u16;

struct acc_02257cfc {
    u16 f0;
    u16 f2b0 : 1;
    u16 _f2hi : 15;
    u16 _f4b01 : 2;
    u16 f4b2 : 1;
    u16 f4b3 : 1;
    u16 _f4b4 : 1;
    u16 f4b5 : 1;
    u16 _f4hi : 10;
    char _pad[0x18 - 6];
    u16 f18;
};

extern void func_ov002_0226af38(int a, int b, int c);
extern void *func_ov002_02257464(struct acc_02257cfc *self);

int func_ov002_02257cfc(struct acc_02257cfc *self, int arg1) {
    char *r;
    int (*fn)(struct acc_02257cfc *, int);
    if (self->f4b5 && self->f18 == 0x1975) {
        if (!self->f4b2) func_ov002_0226af38(1 - self->f2b0, 1, 1);
        self->f4b3 = 1;
        return 0;
    }
    r = (char *)func_ov002_02257464(self);
    if (r == 0 || (fn = *(int (**)(struct acc_02257cfc *, int))(r + 4)) == 0) return 0;
    return fn(self, arg1);
}
