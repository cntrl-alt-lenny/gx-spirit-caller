/* CAMPAIGN-PREP candidate for func_022a57b8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     jump-table switch; tail-calls pass self; OAM head for case 6
 *   risk:       asm is TRUNCATED inside case 6; cases 6/10 bodies + tail-call arg lists are inferred, struct offsets guessed. INCOMPLETE -> cannot first-build-match; needs full asm. struct-guessed
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_022a57b8 (ov002, class C, MED tier).
 * UNVERIFIED + INCOMPLETE: the provided asm is TRUNCATED mid case-6 (stops at
 * `strh r3,[sp+0x3c]`); cases 6/10 bodies and any default tail are not shown.
 * This skeleton models the visible jump-table dispatch + the head of case 6.
 *   recipe: switch on sel via addls-pc jump table; tail-calls pass self in r0; OAM-template head for case 6.
 */
extern void *func_02006c0c(void *tmpl, int n, int m);
extern void  func_0201d47c(void *oam);
extern void  func_02091554(void *dst, void *font, int glyph);
extern void  func_ov002_0229a414(int z);
extern void  func_ov002_022a392c(void *self);
extern void  func_ov002_022a3f44(void *self);
extern void  func_ov002_022a4874(void *self);
extern void  func_ov002_022a4c90(void *self);
extern void  func_ov002_022a51cc(void *self);
extern char  data_ov002_022cbe28[];
extern char  data_ov002_022cbfec[];
extern char  data_ov002_022cc008[];
extern char  data_ov002_022d0f2c[];

typedef struct {
    int f00;   /* +0x00 sel  */
    int f04;   /* +0x04 arg2 */
    int f08;   /* +0x08 */
    int f0c;   /* +0x0c */
} Self_022a57b8;

typedef struct {
    void           *f00;          /* +0x00 handle */
    char            _p04[0x8];
    int             f0c;          /* +0x0c */
    unsigned short  f10;          /* +0x10 */
    char            _p12[0x2];
    unsigned short  f14;          /* +0x14 attr2 (low nibble = mode) */
} Oam_022a57b8;

void func_ov002_022a57b8(Self_022a57b8 *self, int sel, int arg2)
{
    Oam_022a57b8 oam;          /* sp+0x28 */
    char         buf[0x28];    /* sp+0x50 */
    void        *h;

    self->f00 = sel;
    self->f04 = arg2;
    self->f08 = 0;
    self->f0c = 0;

    switch (sel) {
    case 2: func_ov002_022a392c(self); return;
    case 3: func_ov002_022a3f44(self); return;
    case 4: func_ov002_022a4874(self); return;
    case 5: func_ov002_022a4c90(self); return;
    case 7:
    case 8:
    case 9: func_ov002_022a51cc(self); return;
    case 6:
        if (*(int *)(data_ov002_022d0f2c + 0xc8) != 0)
            func_ov002_0229a414(0);
        func_02091554(buf, data_ov002_022cc008,
                      *(int *)(data_ov002_022cbfec + arg2 * 4));
        h = func_02006c0c(buf, 4, 0);
        func_0201d47c(&oam);
        oam.f00 = h;
        oam.f14 = (oam.f14 & ~0xf) | 0x9;
        /* TRUNCATED: remainder of case 6 not in source asm */
        return;
    default: /* sel 0,1,>10 and case 10 (.L_720, truncated) */
        return;
    }
}
