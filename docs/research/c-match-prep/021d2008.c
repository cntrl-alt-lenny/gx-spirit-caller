/* CAMPAIGN-PREP candidate for func_021d2008 (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: dup if-blocks; uninit first-Fill32 val; (x&0xffff0000)|(v&0xffff) tail idiom
 *   risk:       reshape-able: first Fill32 val=uninitialised local must compile to r0-leftover (no `mov r0`); if mwcc zeroes it, +1 instr. struct-guessed offsets f4/f8/fc/f10 vs real layout.
 *   confidence: med
 */
/* func_ov011_021d2008: tear down up-to-two pending tasks, allocate a w*h
 * word buffer, two guarded Fill32s, then pack w,h into low-16 of f_c,f_10.
 * The struct: { void* task0; int f4; int size_words; u32 fc; u32 f10 }.
 * Two SEPARATE `if (task0)` blocks (asm reads [r6] twice). The FIRST
 * Fill32's `val` arg is left uninitialised on purpose (mwcc keeps r0 = the
 * just-stored buffer ptr); the SECOND uses an explicit 0. Tail inserts use
 * the (x & 0xffff0000)|(v & 0xffff) idiom (mov 0x10000;rsb;and;lsl16;orr). */
extern void *Task_PostLocked(int size, int align, int flags);
extern int Task_InvokeLocked(void *task);
extern void Fill32(int v, void *dst, int size);

typedef struct {
    void *task0;
    int f4;
    int size_words;
    unsigned int fc;
    unsigned int f10;
} ov011_buf_t;

void func_ov011_021d2008(ov011_buf_t *o, int w, int h) {
    int garbage;
    int n = w * h;
    if (o->task0 != 0) {
        Task_InvokeLocked(o->task0);
        o->task0 = 0;
    }
    if (o->task0 != 0) {
        Task_InvokeLocked(o->task0);
        o->task0 = 0;
    }
    o->task0 = Task_PostLocked(n << 2, 4, 0);
    o->size_words = n;
    o->f4 = 0;
    if (o->task0 != 0) {
        Fill32(garbage, o->task0, o->size_words << 2);
        o->f4 = 0;
    }
    if (o->task0 != 0) {
        Fill32(0, o->task0, o->size_words << 2);
        o->f4 = 0;
    }
    o->fc = (o->fc & 0xffff0000u) | ((unsigned int)w & 0xffffu);
    o->f10 = (o->f10 & 0xffff0000u) | ((unsigned int)h & 0xffffu);
}
