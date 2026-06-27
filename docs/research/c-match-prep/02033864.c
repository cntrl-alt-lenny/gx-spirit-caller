/* CAMPAIGN-PREP candidate for func_02033864 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind self across uses; guarded |= / &=~ predicated RMW; early return 0
 *   risk:       Tail return value indeterminate in asm (no clean mov r0 on fallthrough); my 'return self->flags' may add a stray ldr — reshape-able by returning a void/unset path. func_02046ae0/ba8 modeled no-arg (asm never sets r0).
 *   confidence: med
 */
/* func_02033864 (main, class C) — guarded flag set/clear via cmp predication.
 * r0=self->r4 held across. (flags&0x10000)? return 0. Then two guarded RMW of bit 0x10000. */
typedef struct {
    unsigned char _pad_00[0xeb4];
    unsigned int flags;   /* +0xeb4 */
} Obj_02033864;

extern int func_02046ae0(void);
extern int func_02046ba8(void);

int func_02033864(Obj_02033864 *self)
{
    if (self->flags & 0x10000)
        return 0;
    if (func_02046ae0() > 1)
        self->flags |= 0x10000;
    if (func_02046ba8() != 0)
        self->flags &= ~0x10000;
    return self->flags;
}
