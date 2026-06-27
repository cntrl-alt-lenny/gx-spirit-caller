/* CAMPAIGN-PREP candidate for func_021b35e4 (ov010, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     cached tile base; signed-16 fields; val++ across both loops; `val|(pal<<12)` operand-first; post-inc dest
 *   risk:       ov010 catalogues this a WALL: orig keeps an inline running index with `strh [r3],#2` post-inc and recomputes `orr` each iter; mwcc tends to synthesize an `i*N` counter / hoist the OR. permuter-class (loop strength-reduction + post-inc shape mwcc won't emit from this C; ship .s if it resists).
 *   confidence: low
 */
/* func_ov010_021b35e4 (ov010, class C): nested tilemap fill loop, mla stride, reg-alloc.
 * cached base from func_ov010_021b2b80(self). o fields are signed 16-bit:
 * f0=col, f2=row(*32), f4=cols, f6=rows. dest = base + (col + row*32)*2.
 * `val` increments continuously across BOTH loops (never reset). pal<<12 OR'd
 * with val: write `val | (pal<<12)` (orig orr r0,val,pal lsl#12 — val operand-first).
 * Outer advances dest by (32 - cols) tiles per row. Decimal offsets (ov010 style). */

extern unsigned short *func_ov010_021b2b80(void *self);

void func_ov010_021b35e4(void *self, char *o, int val, int pal) {
    unsigned short *dest = func_ov010_021b2b80(self);
    int rows = *(short *)(o + 6);
    int cols;
    int i, j;

    dest += *(short *)(o + 0) + (*(short *)(o + 2) << 5);
    cols = *(short *)(o + 4);
    if (rows <= 0) {
        return;
    }

    for (i = 0; i < rows; i++) {
        for (j = 0; j < cols; j++) {
            *dest++ = (unsigned short)(val | (pal << 12));
            val++;
        }
        dest += 32 - cols;
    }
}
