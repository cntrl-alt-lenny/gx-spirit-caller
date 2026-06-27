/* CAMPAIGN-PREP candidate for func_02224cf4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla as base+(sel&1)*STRIDE+0x260+s*4; signed test via movs/bpl => if(s<0)
 *   risk:       reshape-able: the r0 passed to func_021d8288 is the live state, not 0x80 literal (asm leaves r0 as prior value); decl-order of sel/s and the mla fold (mla vs add+mla) may diverge.
 *   confidence: low
 */
/* func_ov002_02224cf4 : state dispatch + mla index, movs-sign branch (class D) */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

struct Entity { u16 f0; u16 f2; u16 f4; u16 f6; u16 f8; };

extern u8  data_ov002_022ce288[]; /* state @ +0x5a8 (LIT0) */
extern u8  data_ov002_022cf16c[]; /* table base (LIT1) */
#define STRIDE 0x868              /* LIT2 */

extern int func_ov002_021ae400(int, int);
extern int func_ov002_021ba294(int);
extern int func_ov002_021d8288(int, void *);
extern int func_ov002_021e286c(int);
extern int func_ov002_0226b054(int);

int func_ov002_02224cf4(struct Entity *e)
{
    int st = *(int *)(data_ov002_022ce288 + 0x5a8);
    u16 f8 = e->f8;                 /* ldrh [r4,#8] hoisted early */
    (void)f8;
    if (st == 0x64) {              /* .L_188 */
        func_ov002_021e286c(1 - ((e->f2 << 0x1f) >> 0x1f));
        return 0;
    }
    if (st == 0x78) {             /* .L_170 */
        func_ov002_0226b054((e->f2 << 0x1f) >> 0x1f);
        return 0x64;
    }
    if (st == 0x80) {
        int s = func_ov002_021ba294((e->f2 << 0x1f) >> 0x1f);
        if (s < 0) {              /* bpl skips => taken when negative */
            func_ov002_021ae400((e->f2 << 0x1f) >> 0x1f, 0xd);
            return 0x78;
        } else {                  /* .L_140 */
            u32 sel = 1 - ((e->f2 << 0x1f) >> 0x1f);
            u8 *p = data_ov002_022cf16c + (sel & 1) * STRIDE + 0x260 + s * 4;
            func_ov002_021d8288(0x80, p); /* r0 arg trampled? see risk */
            return 0x64;
        }
    }
    return 0;                     /* .L_1a4 */
}
