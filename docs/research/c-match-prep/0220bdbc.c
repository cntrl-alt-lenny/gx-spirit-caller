/* CAMPAIGN-PREP candidate for func_0220bdbc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: kind :6 bitfield; short-circuit && chain -> cmpeq/ldreq cascade; g->f4 reused as call arg0
 *   risk:       reshape-able/struct-guessed: the && cascade must compile to the cmpeq/ldreq/cmpeq predicated chain (single guard block); orig passes leftover g->f4 in r0 to 021ba104 -- modeled by passing g->f4. data_022cd3f4 layout shared with 0220ba94.
 *   confidence: med
 */
/* func_ov002_0220bdbc (ov002, class D, MED) — batch p_0027.
 * chained eq-guards: kind==0x12 && g->f8==0 && g->f4==w2.b0; then
 * 021ba104(g->f4, g->f20, 0x18a8) -> nonzero ? 1 : 0. g = data_022cd3f4. */
typedef unsigned short u16;

struct Self0220bdbc {
    u16 f0;
    struct { u16 b0:1; u16 f1:5; u16 kind:6; u16 f12:2; u16 _t:2; } w2; /* +0x2 */
};
struct G0220bdbc { int f0; int f4; int f8; unsigned char _pad[0x14]; int f20; };

extern struct G0220bdbc data_ov002_022cd3f4;
extern int func_ov002_021ba104(int a, int b, int c);

int func_ov002_0220bdbc(struct Self0220bdbc *self) {
    if (self->w2.kind == 0x12 &&
        data_ov002_022cd3f4.f8 == 0 &&
        data_ov002_022cd3f4.f4 == self->w2.b0) {
        if (func_ov002_021ba104(data_ov002_022cd3f4.f4,
                                data_ov002_022cd3f4.f20, 0x18a8) != 0)
            return 1;
    }
    return 0;
}
