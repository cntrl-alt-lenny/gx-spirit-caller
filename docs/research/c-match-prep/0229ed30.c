/* CAMPAIGN-PREP candidate for func_0229ed30 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order field copy; cnt++/>1 guard; LOCAL union +0x28 RMW (f6,e,g order); two helper calls
 *   risk:       permuter-class+struct-guessed: multi-field bitfield-RMW on a stack-local union (strh r1,[sp] each step) rarely matches mwcc reg-alloc; copy field types (sb/sh) inferred. Already .s.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_0229ed30 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. ships-as-.s today (multi-field-RMW wall).
 *   recipe: field-by-field struct copy in EXACT store order; cnt++; >1 guard;
 *           +0x28 bitfield via LOCAL union copy (stack), f6/e/g RMW order, two helper calls.
 */
typedef union { unsigned short hw; struct {
    unsigned short b0 : 1; unsigned short f1 : 5; unsigned short f6 : 8;
    unsigned short e : 1;  unsigned short g : 1;
} b; } Cfg28;

typedef struct {
    signed char   a0, a1, a2, a3;   /* +0x00 */
    short  h4, h6, h8;              /* +0x04 */
    unsigned short ha;             /* +0x0a */
    int    wc, w10;                /* +0x0c,+0x10 */
    char   _pad14[0x14];           /* +0x14 sub-struct */
    unsigned short f28;            /* +0x28 */
    short  cnt;                    /* +0x2a */
} ObjED;

typedef struct {
    signed char   a0, a1, a2, a3;
    short  h4, h6, h8; unsigned short ha; int wc, w10;
} SrcED;

extern int  func_ov002_021c988c(int, int, int);
extern int  func_ov002_021c9504(int, int, int);
extern void func_ov002_0229d184(void *dst, int id, unsigned short *cfg);

void func_ov002_0229ed30(ObjED *s, SrcED *src, int sel) {
    Cfg28 c;
    int v, id;

    if (sel == 0 && s->cnt != 0) {
        /* copy into the sub-struct at +0x14 */
        s->_pad14[0]=src->a0; s->_pad14[1]=src->a1; s->_pad14[2]=src->a2; s->_pad14[3]=src->a3;
        *(short *)(s->_pad14+4)=src->h4; *(short *)(s->_pad14+6)=src->h6;
        *(short *)(s->_pad14+8)=src->h8; *(unsigned short *)(s->_pad14+0xa)=src->ha;
        *(int *)(s->_pad14+0xc)=src->wc; *(int *)(s->_pad14+0x10)=src->w10;
        s->cnt++;
        return;
    }
    s->a0=src->a0; s->a1=src->a1; s->a2=src->a2; s->a3=src->a3;
    s->h4=src->h4; s->h6=src->h6; s->h8=src->h8; s->ha=src->ha;
    s->wc=src->wc; s->w10=src->w10;
    s->cnt++;
    if (s->cnt <= 1) return;

    c.hw = s->f28;
    v = (c.b.f1 == 0xd) ? 1 : (s->cnt - 2);
    c.b.f6 = (unsigned short)v;
    c.b.e = func_ov002_021c988c(c.b.b0, c.b.f1, c.b.f6) & 1;
    c.b.g = 0;
    id = func_ov002_021c9504(c.b.b0, c.b.f1, c.b.f6);
    func_ov002_0229d184(&s->_pad14[0], id, &c.hw);
}
