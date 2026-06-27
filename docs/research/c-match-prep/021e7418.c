/* CAMPAIGN-PREP candidate for func_021e7418 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: byte-field insert RMW (bic+orr+str), jump-table switch fallthrough
 *   risk:       struct-guessed AND permuter-class: every global offset (0x490/0x598/0x5a0/0x688) and the counter struct are inferred; tail truncated so fallthrough chain is partial; 'addls pc,pc,r3,lsl#2' needs a dense 0..4 switch and the RMW store order must stay bic-then-orr.
 *   confidence: low
 */
/* func_ov002_021e7418: jump-table dispatch on a byte phase field
 * (state->phase = bits[15:8] of word at +0x18), cases fall through and a
 * byte-field RMW (bic #0xff00; orr; str) increments the counter. Each
 * case guards on a global flag and tail-calls a handler.
 * NOTE: asm truncated after case .L_e0 (cases .L_11c/.L_158 and the rest
 * of the fallthrough chain are reconstructed); struct offsets guessed. */
extern void func_ov002_021e3dac(void);
extern void func_ov002_021e4ba8(void);
extern void func_ov002_021e72a8(void);
extern void func_ov002_022465d4(void);

typedef struct {
    char _pad18[0x18];
    unsigned int w18;          /* +0x18: phase in bits[15:8] */
} State021e7418;            /* _LIT0 */

typedef struct {
    char _pad490[0x490];
    int f490;                  /* +0x490 */
    char _pad5a0[0x5a0-0x490-4];
    int f5a0;                  /* +0x5a0 */
    char _pad598[0x598-0x5a0-4 < 0 ? 0 : 0]; /* placeholder */
} Globals021e7418;          /* _LIT1: fields 0x598,0x5a0,0x490,0x688 (offsets guessed) */

extern State021e7418 data_ov002_022cd300;   /* _LIT0 */
extern unsigned int  data_ov002_022ce288[]; /* _LIT1 globals base */
extern unsigned int  data_ov002_022cd318;   /* _LIT2 counter word */

static void bump(unsigned int *p) {
    unsigned int phase = (*p << 16) >> 24;      /* bits[15:8] */
    phase = (phase + 1) & 0xff;
    *p = (*p & ~0xff00u) | (phase << 8);
}

void func_ov002_021e7418(void) {
    State021e7418 *st = &data_ov002_022cd300;
    unsigned int *g = data_ov002_022ce288;
    unsigned int phase = (st->w18 << 16) >> 24; /* bits[15:8] */
    switch (phase) {
    case 0:
        if (g[0x688/4] != 0) { func_ov002_022465d4(); return; }
        st->w18 = (st->w18 & ~0xff00u) | (((phase + 1) & 0xff) << 8);
        /* fall through */
    case 1:
        if (g[0x5a0/4] != 0) { func_ov002_021e4ba8(); return; }
        bump(&data_ov002_022cd318);
        /* fall through */
    case 2:
        if (g[0x598/4] == 0 && g[0x490/4] != 0) func_ov002_021e72a8();
        bump(&data_ov002_022cd318);
        /* fall through */
    case 3:
        if (g[0x598/4] != 0) { func_ov002_021e3dac(); return; }
        bump(&data_ov002_022cd318);
        /* fall through */
    case 4:
    default:
        return;
    }
}
