/* CAMPAIGN-PREP candidate for func_021ba0f0 (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch on f38; bind flags accumulator in r4; orrne/biceq from global; short-circuit && gate
 *   risk:       permuter-class: case-2 early-return + r4 (flags) liveness held across two bl calls is reg-alloc walled; the moveq/movne flag-merge tail is alloc-order sensitive. Already shipped as .s (brief 302).
 *   confidence: low
 */
/* func_ov006_021ba0f0 — per-frame state-machine tick: f0202224c() result is the
 * flag accumulator; switch on self->f38 advances sub-state via f3c, then a
 * common tail toggles flag bit1 from a global, posts via f02022234, and on the
 * (f74 && f7c) gate accumulates f68 by a global delta; bumps f3c. */
extern int  func_0202224c(int a);
extern void func_02022234(int a, int b);
extern int  func_ov006_021ba1f8(void *self);
extern int  func_ov006_021ba364(void *self);
extern char data_021040ac[];
extern char data_ov006_0225e100[];

typedef struct {
    char _pad0[0x38];
    int  f38;            /* 0x38 */
    int  f3c;            /* 0x3c */
    char _pad40[0x28];
    int  f68;            /* 0x68 */
    char _pad6c[0x08];
    int  f74;            /* 0x74 */
    char _pad78[0x04];
    int  f7c;            /* 0x7c */
} Ov006TickS;

int func_ov006_021ba0f0(Ov006TickS *self) {
    int flags = func_0202224c(0);
    switch (self->f38) {
    case 0:
        if (self->f3c == 3) {
            func_ov006_021ba1f8(self);
            self->f38 = 1;
            self->f3c = 0;
        }
        break;
    case 1:
        if (self->f3c == 0xf) self->f7c = 1;
        if (func_ov006_021ba364(self)) {
            self->f38 = 2;
            self->f3c = 0;
            flags |= 1;
        }
        break;
    case 2:
        return 1;
    }
    if (*(int *)(data_ov006_0225e100 + 0x8) != 0) flags |= 2;
    else flags &= ~2;
    func_02022234(0, flags);
    if (self->f74 != 0 && self->f7c != 0)
        self->f68 += *(int *)(data_021040ac + 0x30);
    self->f3c++;
    return 0;
}
