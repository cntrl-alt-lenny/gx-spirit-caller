/* CAMPAIGN-PREP candidate for func_021b9ba0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: :13 key bitfield arg; reload field after call; bit14 as :1 field
 *   risk:       orig RELOADS *(u32*)self after the bl (two ldr [r4]); if mwcc caches the word in a callee reg the second ldr collapses. reshape-able (two separate field reads, no local cache). struct-guessed bit layout
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_021b9ba0 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * Drop into src/, run ninja + objdiff, apply the risk note below.
 *   recipe:   CLASS D: :13 field (lsl#19;lsr#19) as bitfield arg; reload [r4] not bind; bit14 (lsl#17;lsr#31) as :1 bitfield; result==0 -> return 1.
 *   risk:     orig RELOADS *(u32*)self twice (ldr [r4] before the call AND again after) rather than binding it in a callee reg; if mwcc keeps the word live across the bl in one reg the second ldr collapses. reshape-able (read self->w as two separate field accesses, do not cache in a local).
 *   confidence: med
 */
/* func_ov002_021b9ba0(self): w=*self; if (func_0203058c(w & 0x1fff)==0) return 1;
 * return (*self >> 14) & 1.   key=:13, bit14 via shift-pair. */
typedef unsigned int u32;

typedef struct Rec02 {
    u32 key   : 13;   /* bits 0..12  (lsl#19;lsr#19) */
    u32 _b13  : 1;    /* bit 13 */
    u32 flag  : 1;    /* bit 14     (lsl#17;lsr#31) */
    u32 _hi   : 17;
} Rec02;

extern int func_0203058c(int key);

int func_ov002_021b9ba0(Rec02 *self) {
    if (func_0203058c(self->key) == 0)
        return 1;
    return self->flag;
}
