/* CAMPAIGN-PREP candidate for func_02062fc0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     zero-init struct then ordered field stores; bind src->handle60 reload pattern
 *   risk:       htons-free; main risk is the four zero-init stores reordering vs the field stores (asm interleaves mov r5,r0). reshape-able via decl/assignment order; struct offsets struct-guessed.
 *   confidence: med
 */
/* func_02062fc0: build a 0x14 stack struct (first 4 words zeroed, then
 * filled with src fields + a helper result), pass to func_0205407c, and
 * return whether the post-call list length grew by exactly one entry.
 * Networking/list-insert style helper (main module). */

extern int  func_02055330(void);          /* current tick / id            */
extern int  func_02054140(int handle);    /* list count                   */
extern void func_0205407c(int handle, void *entry);

typedef struct {
    int  word0;   /* +0x00 */
    int  field4;  /* +0x04 */
    int  half8;   /* +0x08 */
    int  fieldc;  /* +0x0c */
    int  pad10;   /* +0x10 (reserved, never touched) */
} Entry;

typedef struct {
    /* only the offsets the asm touches are modelled */
    char _pad0[0x58];
    int  word58;  /* +0x58 */
    char _pad5c[0x60 - 0x5c];
    int  handle60;/* +0x60 */
} Src;

int func_02062fc0(Src *src, int half, int arg2)
{
    Entry e;
    int before;

    e.word0  = 0;
    e.field4 = 0;
    e.half8  = 0;
    e.fieldc = 0;

    e.word0  = src->word58;
    e.field4 = arg2;
    e.half8  = (short)half;          /* strh r1,[sp,#0x8] */
    e.fieldc = func_02055330();

    before = func_02054140(src->handle60);
    func_0205407c(src->handle60, &e);
    return (before + 1) == func_02054140(src->handle60);
}
