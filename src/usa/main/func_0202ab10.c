/* CAMPAIGN-PREP candidate for func_0202ab10 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     field stores (word+u16 RMW) + two calls, store order preserved
 *   risk:       struct offsets guessed; f_d8 width (str=word) ok; f_de/f_e0/f_ea must be u16 (strh)
 *   confidence: high
 */
/* func_0202ab10: field stores (word @0xd8=2, u16 @0xea |= 2), call
 * func_0202ab88(self), zero u16 @0xde and @0xe0, call func_0202ac98(self),
 * return 1. */

extern void func_0202ab88(void *p);
extern void func_0202ac98(void *p);

typedef struct Obj0202ab64 {
    char            _pad_00[0xd8];
    int             f_d8;          /* +0xd8 (word) */
    char            _pad_dc[0xde - 0xdc];
    unsigned short  f_de;          /* +0xde */
    unsigned short  f_e0;          /* +0xe0 */
    char            _pad_e2[0xea - 0xe2];
    unsigned short  f_ea;          /* +0xea */
} Obj0202ab64;

int func_0202ab10(Obj0202ab64 *self) {
    self->f_d8 = 2;
    self->f_ea |= 2;
    func_0202ab88(self);
    self->f_de = 0;
    self->f_e0 = 0;
    func_0202ac98(self);
    return 1;
}
