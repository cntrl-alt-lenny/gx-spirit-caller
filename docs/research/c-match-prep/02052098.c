/* CAMPAIGN-PREP candidate for func_02052098 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind e=(*g)+id*0x30 (mla) across body; branch-table on func_0205272c; store-order; strh x22
 *   risk:       e held in r5 via one mla across calls; if mwcc re-derives base post-call the mla re-issues. x1d/x1e/x22 struct-guessed (Ring/Owner reused from 02051f98). permuter-class + struct-guessed.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02052098 (main, class D, MED tier) — brief 497.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind e=(*g)+id*0x30 (r5,mla) across body; branch-table on func_0205272c; store-order x18/x10/x1d; halfword x22
 *   risk:       e is held in r5 across the whole body via a single mla (id*0x30 + *g); the switch sets e->flag(0x1d) to 2/4/3 and the final strh always writes e->x22. If mwcc re-derives the base after a call instead of binding r5, the mla re-issues. Owner/Ring offsets reused from 02051f98 (verified pattern) but x1d/x1e/x22 are struct-guessed. permuter-class (mla base bind) + struct-guessed.
 *   confidence: med
 */
/* func_02052098 — main, cls D. r0=id, r1=ev(r7), r2=arg(r6). base e=(*g)+id*0x30
   bound in r5 via one mla. e->x1e = (u8)func_02052334(). switch(func_0205272c(ev)):
   cases 0,1 -> .L_208 (just strh); case 2 -> .L_1a4 packet path; cases 3,4,5 ->
   .L_200 (e->flag=3). Tail .L_208 always does strh r4,[e,#0x22] (r4 holds the
   func_0205272c result). Same *g/stride-0x30  as 02051f98 Ring/Owner. */
typedef struct Ring {
    unsigned char _p0[4];
    int           x4;     /* +0x04 */
    int           x8;     /* +0x08 */
    unsigned char _pc[4];
    int           x10;    /* +0x10 */
    unsigned char _p14[4];
    int           x18;    /* +0x18 */
    unsigned char _p1c;
    unsigned char flag;   /* +0x1d */
    unsigned char x1e;    /* +0x1e */
    unsigned char _p1f[3];
    unsigned short x22;   /* +0x22 */
} Ring;                   /* sizeof == 0x30 */

extern Ring *data_0219e3ec;                 /* *g */
extern int  func_02052334(void);
extern int  func_0205272c(int ev);
extern void func_02094688(int ev, void *dst, int n);

void func_02052098(int id, int ev, int arg)
{
    Ring *e = (Ring *)((char *)data_0219e3ec + id * 0x30);
    int sel;

    e->x1e = (unsigned char)func_02052334();
    sel = func_0205272c(ev);

    switch (sel) {
    case 0:
    case 1:
        break;                              /* .L_208 */
    case 2:                                 /* .L_1a4 */
        if (arg != 8)
            return;
        {
            int packet;
            func_02094688(ev, &packet, 8);
            e->x18 = packet;
            e->x10 = 0;
            if (e->x4 != 0 && e->x8 >= e->x18) {
                e->flag = 2;
                break;                      /* bge .L_208 */
            }
            /* .L_1f4 */
            e->flag = 4;
        }
        break;
    default:                                /* 3,4,5 -> .L_200 */
        e->flag = 3;
        break;
    }

    /* .L_208 */
    e->x22 = (unsigned short)sel;
}
