/* CAMPAIGN-PREP candidate for func_02206268 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     ordered strh state stores (1 then 2) + two >=0/!=0 guard arms
 *   risk:       struct-guessed: 021ff3bc is declared 1-arg in core.h but asm passes r1=arg1 here — call needs the 2-arg form (fn-ptr cast if the proto blocks it). Store order (state=1 before the first call, state=2 after) must not be hoisted; keep both writes.
 *   confidence: med
 */
/* func_ov002_02206268 (ov002, D) — store state flags into self+0xc in asm order,
 * with two guard branches.
 *   strh #1,[r5,#0xc]                       (self->state = 1)  FIRST store
 *   if 021bd030(b0) >= 0:   (blt .L_40 skips this arm)
 *       if 022577dc(self) != 0 return 2
 *   .L_40: strh #2,[r5,#0xc]               (self->state = 2)  SECOND store
 *          if 021ff3bc(self, arg1) != 0:    (asm passes r1=arg1)
 *              if 022577dc(self) != 0 return 2
 *   return 0.
 *   b0 = [r5,#2] lsl#0x1f;lsr#0x1f. self+0xc is a u16 (strh). */
typedef unsigned short u16;
struct S02206268 {
    u16 f0;
    u16 b0 : 1; u16 rest : 15;       /* +2 */
    char _pad4[8];
    u16 state;                       /* +0xc */
};

extern int func_ov002_021bd030(int b0);
extern int func_ov002_022577dc(struct S02206268 *self);
extern int func_ov002_021ff3bc(struct S02206268 *self, int arg1);

int func_ov002_02206268(struct S02206268 *self, int arg1) {
    self->state = 1;
    if (func_ov002_021bd030(self->b0) >= 0) {
        if (func_ov002_022577dc(self) != 0)
            return 2;
    }
    self->state = 2;
    if (func_ov002_021ff3bc(self, arg1) != 0) {
        if (func_ov002_022577dc(self) != 0)
            return 2;
    }
    return 0;
}
