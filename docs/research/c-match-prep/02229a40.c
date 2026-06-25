/* CAMPAIGN-PREP candidate for func_02229a40 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfields (:1 + :9 asym), guard, reload-on-2nd-call
 *   risk:       f4 9-bit field offset/width guessed; equivalently raw (unsigned)(f4<<17)>>23; f2 re-read should match.
 *   confidence: med
 */
/* func_ov002_02229a40: gate on 021d7268(b0@+2, field9@+4, 1); if set, fire
 * 021e286c(b0@+2) (f2 re-loaded). return 0. */
typedef unsigned short u16;

struct S02229a40 {
    u16 f0;        /* +0 */
    u16 b0 : 1;    /* +2 bit0 */
    u16 _r2 : 15;
    u16 _lo6 : 6;  /* +4 */
    u16 f4mid : 9; /* +4 bits[14:6] -> lsl#17;lsr#23 */
    u16 _hi1 : 1;
};

extern int func_ov002_021d7268(int a, int b, int c);
extern void func_ov002_021e286c(int a);

int func_ov002_02229a40(struct S02229a40 *self) {
    if (func_ov002_021d7268(self->b0, self->f4mid, 1))
        func_ov002_021e286c(self->b0);
    return 0;
}
