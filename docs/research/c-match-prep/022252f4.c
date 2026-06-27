/* CAMPAIGN-PREP candidate for func_022252f4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     (short) packed decode a/b; stack-arg stores in asm order; guard short-circuit chain
 *   risk:       reshape-able/struct-guessed: func_021d5a08 takes 2 stacked args (str[sp]=1, str[sp+4]=sel) whose param positions are guessed; store-order of the two str must match, and the 5th/6th arg signatures are inferred.
 *   confidence: low
 */
/* func_ov002_022252f4 : guard + inner state dispatch, store-order stack args (class D) */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

struct Entity { u16 f0; u16 f2; u16 f4; u16 f6; u16 f8; u16 fa; u16 fc; };

extern short func_ov002_0223de94(void *, int);
extern int func_ov002_0223df38(int, int, int);
extern int func_ov002_0225764c(void *, int, int);
extern int func_ov002_021c1a2c(int, int, u16);
extern int func_ov002_021c1d28(int, int, int);
extern int func_ov002_021d5a08(void *, int, int, u16, int);
extern int func_ov002_021d6808(void *, int, int, int, int);
extern int func_ov002_0226b11c(int, int);

int func_ov002_022252f4(struct Entity *e)
{
    u32 a, b;
    short v;
    if (func_ov002_0223df38(0, 0, 0) == 0) return 0;
    v = func_ov002_0223de94(e, 0);
    a = v & 0xff;
    b = (v >> 8) & 0xff;
    if (func_ov002_0225764c(e, a, b) == 0) return 0;
    if (e->fc == 1) {                       /* .L_70 */
        func_ov002_021d6808(e, a, b, 0, 1); /* last arg via str ip,[sp] */
        return 0;
    }
    if (e->fc == 2) {                       /* .L_98 */
        u32 sel = (e->f2 << 0x1f) >> 0x1f;
        /* stack args pushed in order: [sp]=1, [sp+4]=sel */
        func_ov002_021d5a08(e, a, b, e->f0, 1 /*,[sp]*/);
        if (a != ((e->f2 << 0x1f) >> 0x1f)) {        /* .L_114 guard */
            int t = (sel != /*reread*/ ((e->f2 << 0x1f) >> 0x1f)) ? 1 : 0;
            (void)t;
            if (func_ov002_021c1d28(a, b, 1) == 0
                && func_ov002_021c1a2c(a, b, e->f0))
                func_ov002_0226b11c(a, b);
        }
        return 0;
    }
    return 0;                               /* .L_120 */
}
