/* CAMPAIGN-PREP candidate for func_02023f7c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: bind slot A in r4 across call; two-symbol dup-pool; size temp reused (mul once)
 *   risk:       permuter-class/struct-guessed: the duplicated data_0219a8e4 pool word is the brief-201 E-07 1-insn CSE wall — un-matchable in pure mwcc 2.0 C; REQUIRES the _alias second symbol from the scaffolder (else escape to .s).
 *   confidence: low
 */
/* func_02023f7c: zero an 8-byte manager (Fill32), store arg0 as saved_arg,
 * and if handle is still null, allocate via Task_PostLocked(saved_arg*0x88,
 * 4, 0), store the handle, and zero the allocation. Returns 1.
 *
 * KNOWN WALL (brief-201 E-07): orig has TWO pool words both = data_0219a8e4
 * (slot A in r4 held across the call, slot B reloaded for saved_arg write).
 * mwcc 2.0 CSEs them to a single slot -> 1-insn diff. The two-symbol +
 * volatile recipe (see func_02023f98) is the only known coercion.
 *
 * Manager { void *handle; int saved_arg; } at data_0219a8e4. r4 binds slot A
 * across Fill32 and the later [r4,#4]/[r4,#0] reads (bind, not reload).
 */

typedef struct { void *handle; int saved_arg; } mgr_0219a8e4_t;

extern mgr_0219a8e4_t data_0219a8e4;        /* slot A */
extern mgr_0219a8e4_t data_0219a8e4_alias;  /* slot B (linker alias, same addr) */
extern void Fill32(int v, void *dst, int size);
extern void *Task_PostLocked(void *arg0, int arg1, int arg2);

int func_02023f7c(int arg0) {
    mgr_0219a8e4_t *a = &data_0219a8e4;
    mgr_0219a8e4_t *b = &data_0219a8e4_alias;
    int size;

    Fill32(0, a, 8);
    b->saved_arg = arg0;
    if (b->handle == 0) {
        size = a->saved_arg * 0x88;
        a->handle = Task_PostLocked((void *)size, 4, 0);
        Fill32(0, a->handle, size);
    }
    return 1;
}
