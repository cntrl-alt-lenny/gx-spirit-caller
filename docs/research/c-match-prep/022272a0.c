/* CAMPAIGN-PREP candidate for func_022272a0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit0 bitfield + 1-player rsb; per-arm reload of b0; if-assign compare a>b
 *   risk:       struct-guessed AND incomplete: batch asm TRUNCATED mid-0x7e arm (.L_324/.L_364/tail missing) and r5/r6 cmp result use unknown; will NOT match until full .s pulled
 *   confidence: low
 */
/* func_ov002_022272a0: cls D. self at r0. Scene-state switch on
 * *(int*)(ce288+0x5a8) {0x7e,0x7f,0x80, else .L_364}. player = self->bit0.
 * WARNING: the batch asm is TRUNCATED at line 90 (the 0x7e arm continues past
 * func_021b9b64 and .L_324/.L_364 are not shown). This TU covers the 0x80/0x7f
 * arms fully and the 0x7e arm up to the truncation; pull the full .s before
 * building. */
typedef unsigned short u16;

struct Self {
    u16 f0;            /* +0x0 */
    u16 b0 : 1;        /* +0x2 bit0 */
    u16 f4;
    u16 f6;
    u16 f8;            /* +0x8 */
    u16 fa;            /* +0xa */
};

extern char data_ov002_022ce288[];   /* +0x5a8 scene state */
extern char data_ov002_022d0e6c[];   /* +0xb2 source halfword */
extern void func_ov002_021b9b64(int a);
extern int  func_ov002_021c38c4(int player, int idx);
extern void func_ov002_021df818(struct Self *self, int player, int a);
extern void func_ov002_021e278c(int player, int idx);
extern void func_ov002_021e2b3c(void);
extern int  func_ov002_02257b48(void);
extern void func_ov002_0226afb4(int player, int val);

int func_ov002_022272a0(struct Self *self) {
    int state = *(int *)(data_ov002_022ce288 + 0x5a8);
    if (state == 0x7e) {
        int a, b;
        self->fa = *(u16 *)(data_ov002_022d0e6c + 0xb2);
        func_ov002_021e278c(self->b0 & 1, self->f8);
        func_ov002_021e278c(1 - (self->b0 & 1), self->fa);
        a = func_ov002_021c38c4(self->b0 & 1, self->f8);
        b = func_ov002_021c38c4(1 - (self->b0 & 1), self->fa);
        func_ov002_021e2b3c();
        if (a > b) {
            func_ov002_021df818(self, 1 - (self->b0 & 1), 0x3e8);
            func_ov002_021b9b64(self->fa);
            /* TRUNCATED: batch asm ends here (ldrh r3,[r4,#0x2] ...). */
        }
        return 0; /* placeholder return for the truncated 0x7e arm */
    }
    if (state == 0x7f) {
        self->f8 = *(u16 *)(data_ov002_022d0e6c + 0xb2);
        func_ov002_0226afb4(1 - (self->b0 & 1), self->f0);
        return 0x7e;
    }
    if (state == 0x80) {
        if (func_ov002_02257b48() == 0)
            return 0;
        func_ov002_0226afb4(self->b0 & 1, self->f0);
        return 0x7f;
    }
    return 0; /* .L_364 (not shown in truncated asm) */
}
