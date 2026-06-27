/* CAMPAIGN-PREP candidate for func_021d2158 (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: stream nibble RMW via &~0xf|(v&0xf); halfword (f10<<16)>>16; realloc loop
 *   risk:       permuter-class: 10-callee-saved-reg loop with re-derived loop bound + spilled `slot` (sp,#4); reg-alloc/schedule will diverge. struct-guessed offsets; `slot` first-iter uninit matches asm but fragile.
 *   confidence: low
 */
/* func_ov011_021d2158: open a handle (func_02006c0c(arg1,4,0)), then loop
 * count = (f10_lo16) * (fc>>16) times reading a u16 stream at r6 (+=2),
 * masking its low nibble into f4-slot's low nibble, growing the task buffer
 * when the write index hits the capacity (f8), and storing into base[f4++].
 * Halfword pack uses (f10<<16)>>16 and (fc>>16). 0x3ff = stream mask. */
extern int func_02006c0c(int a, int b, int c);
extern int func_0201d6f8(int a);
extern void *Task_PostLocked(int size, int align, int flags);
extern int Task_InvokeLocked(void *task);
extern void Fill32(int v, void *dst, int size);
extern void Copy32(void *dst, void *src, int size);

typedef struct {
    int *base;     /* +0x00 buffer base   */
    int idx;       /* +0x04 write index   */
    int cap;       /* +0x08 capacity      */
    unsigned int fc;   /* +0x0c hi16 = mult */
    unsigned int f10;  /* +0x10 lo16 = w    */
} ov011_grid_t;

void func_ov011_021d2158(ov011_grid_t *o, int arg1) {
    int hdl = func_02006c0c(arg1, 4, 0);
    int slot;
    unsigned short *src = (unsigned short *)func_0201d6f8(arg1);
    int i = 0;
    int total = (int)(((o->f10 << 16) >> 16) * (o->fc >> 16));
    if (total != 0) {
        do {
            slot = (slot & ~0xf) | (((unsigned int)*src & 0x3ffu) & 0xf);
            if (o->idx >= o->cap) {
                int old = (int)o->base;
                int newcap = o->cap << 1;
                o->base = Task_PostLocked(newcap << 2, 4, 0);
                Fill32(0, o->base, newcap << 2);
                Copy32((void *)old, o->base, o->cap << 2);
                Task_InvokeLocked((void *)old);
                o->cap = newcap;
            }
            o->base[o->idx] = slot;
            o->idx = o->idx + 1;
            src = src + 1;
            i = i + 1;
        } while ((unsigned int)i < (((o->f10 << 16) >> 16) * (o->fc >> 16)));
    }
    Task_InvokeLocked((void *)hdl);
}
