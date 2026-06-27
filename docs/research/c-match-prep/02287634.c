/* CAMPAIGN-PREP candidate for func_02287634 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     row{u32 id:13; u16 f8@8} stride 0x14; bit0 :1; pass2 RE-READS bit0 per-iter (don't bind)
 *   risk:       permuter-class: nested-loop reg-alloc (r4=0x868/r5=cf16c/r8=n held across both loops via mla) plus pass2 re-reads self->bit0 every iteration and recomputes the mla base twice (the doubled if). Loop register coloring + the truncated final epilogue make first-build match unlikely.
 *   confidence: low
 */
/* func_ov002_02287634 (cls D, nested loops + accumulate): TWO passes over per-player 0x868 rows.
 * Pass1: for p in 0..1, for k in 0..4: row=cf16c+(p&1)*0x868+0x30+k*0x14; if(row->id) if(0202e270(id)) n++.
 *   then if (table[1-bit0] <= n*0x1f4) return 1.
 * Pass2: for i in 0..4 over rows of player (1-bit0): if id && f8==0 cnt2++; if id && f8==0 && 0202f9e8() return 0.
 *   return cnt2>0. (asm tail truncated after movgt r0,#1 - final ret-0 path assumed.) */
typedef unsigned short u16;
typedef unsigned int u32;
struct Row7634 { u32 id:13; u8 pad[5]; u16 f8; };
struct S7634 { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf16c[];
extern int func_0202e270(unsigned int id);
extern int func_0202f9e8(void);
int func_ov002_02287634(struct S7634 *self) {
    int n = 0;
    int p, k, i, cnt2;
    for (p = 0; p < 2; p++) {
        struct Row7634 *row = (struct Row7634 *)(data_ov002_022cf16c + (p & 1) * 0x868 + 0x30);
        for (k = 0; k < 5; k++) {
            if (row->id) {
                if (func_0202e270(row->id)) n++;
            }
            row = (struct Row7634 *)((char *)row + 0x14);
        }
    }
    if (*(int *)(data_ov002_022cf16c + ((1 - self->bit0) & 1) * 0x868) <= n * 0x1f4) return 1;
    cnt2 = 0;
    for (i = 0; i < 5; i++) {
        struct Row7634 *r = (struct Row7634 *)(data_ov002_022cf16c + ((1 - self->bit0) & 1) * 0x868 + 0x30 + i * 0x14);
        if (r->id && r->f8 == 0) cnt2++;
        if (r->id && r->f8 == 0) {
            if (func_0202f9e8()) return 0;
        }
    }
    return cnt2 > 0;
}
