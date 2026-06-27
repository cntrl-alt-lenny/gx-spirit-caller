/* CAMPAIGN-PREP candidate for func_021faab4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield f5@5; range [5,10] via bcc+movls; bit0 of arg0->f2; if/else-if state dispatch
 *   risk:       range test orig is `cmp #5;bcc / cmp #0xa;movls` (code=7 predicated). mwcc may emit two branches instead of cmp+movls. reshape-able only partly — the movls coin-flip is permuter-class.
 *   confidence: med
 */
/* func_ov002_021faab4 (ov002, cls C): compute a code via 0202de9c(self->f0);
 * if 0202e234(self->f0) and a 5-bit field@5 of self->f2 is in [5,10], force
 * code=7 (movls coin-flip). Then 2-way dispatch on ce288.f1460: state 0 posts
 * 0226ae50(bit0, 1, code); state 1 forwards 021f4a4c; advance state. */

typedef unsigned short u16;

struct Self21faab4 { u16 f0; u16 b0 : 1; u16 : 4; u16 f5 : 5; };
struct Ce21faab4   { char _a[0x5b4]; int f1460; };

extern struct Ce21faab4 data_ov002_022ce288;

extern int  func_0202de9c(int a);
extern int  func_0202e234(int a);
extern void func_ov002_021f4a4c(void *self2, void *arg1);
extern void func_ov002_0226ae50(int bit0, int one, int code);

int func_ov002_021faab4(void *arg0, void *arg1) {
    struct Self21faab4 *self = (struct Self21faab4 *)arg1;
    int code = func_0202de9c(self->f0);
    if (func_0202e234(self->f0) != 0) {
        int k = self->f5;
        if (k >= 5 && k <= 10) code = 7;
    }
    if (data_ov002_022ce288.f1460 == 0) {
        func_ov002_0226ae50(((struct Self21faab4 *)arg0)->b0, 1, code);
        data_ov002_022ce288.f1460++;
        return 0;
    }
    if (data_ov002_022ce288.f1460 == 1) {
        func_ov002_021f4a4c(arg0, arg1);
        data_ov002_022ce288.f1460++;
        return 0;
    }
    return 1;
}
