/* CAMPAIGN-PREP candidate for func_02038fb0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order: array A fully then array B then counter; reload cursors via global
 *   risk:       reload-vs-bind: orig RELOADS each cursor 3x (ldr [r2,#0x10]); if mwcc's aliasing keeps it in a reg the loads collapse. permuter-class (depends on mwcc alias model). f0c/f10/f14 struct-guessed.
 *   confidence: med
 */
/* func_02038fb0 (cls D): append to two parallel growing arrays (always-terminated:
 * write value at cursor[0], terminator at cursor[1], advance cursor by 1 elem),
 * then bump a s16 counter. Cursors RELOADED through the global each store (the
 * stores through the cursor alias the global) -> matches 3x ldr each cursor. */

typedef struct thing_s thing_t;

typedef struct {
    char       _pad_00[0x0c];
    void     **cursor_b;   /* 0x0c */
    unsigned  *cursor_a;   /* 0x10 */
} list_mgr_t;

struct thing_s { char _pad[0x14]; unsigned field14; /* 0x14 */ };

extern list_mgr_t data_0219c480;
extern short       data_020fe4c0;

void func_02038fb0(thing_t *t) {
    if (data_0219c480.cursor_a == 0)
        return;
    *data_0219c480.cursor_a = t->field14;
    data_0219c480.cursor_a[1] = 0xffff;
    data_0219c480.cursor_a += 1;

    *data_0219c480.cursor_b = t;
    data_0219c480.cursor_b[1] = 0;
    data_0219c480.cursor_b += 1;

    data_020fe4c0++;
}
