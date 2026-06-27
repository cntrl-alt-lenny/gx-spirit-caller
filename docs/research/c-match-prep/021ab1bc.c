/* CAMPAIGN-PREP candidate for func_021ab1bc (ov009, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     stack sprite struct + halfword mask RMW in store order; 16B ldmia/stmia as int[4] copy
 *   risk:       Asm is TRUNCATED (no epilogue/pool) — TU covers only the visible prefix and cannot byte-match the whole function. Plus all sp+0x28 offsets are struct-guessed. struct-guessed (confirm real OAM struct + obtain the full asm tail before building).
 *   confidence: low
 */
/* func_ov009_021ab1bc (ov009, class C): 360B OAM dual-sprite marshalling.
 * WARNING: the supplied asm is TRUNCATED — it ends at `str r1,[sp,#0x8]` with no
 * epilogue and no literal pool, so the function continues past the captured body
 * (a func_0201e7e0/arg-block call sequence is mid-setup). This TU translates ONLY
 * the visible prefix; it CANNOT be byte-complete. The stack sprite struct at
 * sp+0x28 (fields f0=handle, fc, f14h, f10l etc) is struct-guessed. Halfword RMWs
 * (ldrh;bic;orr;strh) modelled as explicit masks on u16 (NOT :N bitfields). */

extern char data_ov009_021ad83c[];
extern char data_ov009_021ad960[];
extern char data_ov009_021ad978[];
extern char data_ov009_021adc00[];

extern void func_02094504(int a, void *b, int c);
extern void func_0202c948(int a, int b);
extern void func_0201d47c(void *oam);
extern int  func_02006c0c(void *src, int a, int b);
extern void func_0201e5b8(void *oam);
extern void func_02006e1c(int handle);
extern void func_0201e7e0(void);

struct oam_work {           /* stack struct at sp+0x28, sizes struct-guessed */
    int            handle;  /* +0x00 (sp+0x28) */
    char           _p04[0x0c];
    int            f0c;      /* +0x0c (sp+0x34) */
    unsigned short f10;      /* +0x10 (sp+0x38) */
    unsigned short f14;      /* +0x14 (sp+0x3c) */
    int            f18;      /* +0x18 (sp+0x40) */
};

void func_ov009_021ab1bc(void *self) {
    struct oam_work w;
    int blk[4];

    func_02094504(0, data_ov009_021ad83c, 0x48);
    *(int *)((char *)self + 0x4) = 0;
    *(int *)((char *)self + 0xc) = 0;
    *(unsigned char *)((char *)self + 0x14) = 0;
    *(int *)((char *)self + 0x8) = 0;
    func_0202c948(1, 2);

    /* sprite 1 */
    func_0201d47c(&w);
    w.handle = func_02006c0c(data_ov009_021ad960, 4, 0);
    w.f0c = 0;
    w.f10 = 0;
    w.f14 = (unsigned short)((w.f14 & ~0xf) | 0x3);
    w.f14 = (unsigned short)(w.f14 | 0x10);
    w.f18 = (w.f18 & ~0x1c000) | 0xc000;
    func_0201e5b8(&w);
    func_02006e1c(w.handle);

    /* sprite 2 */
    func_0201d47c(&w);
    w.handle = func_02006c0c(data_ov009_021ad978, 4, 0);
    w.f0c = 0;
    w.f14 = (unsigned short)((w.f14 & ~0xf) | 0x4);
    w.f10 = 0x80;
    w.f14 = (unsigned short)(w.f14 & ~0x10);
    func_0201e5b8(&w);
    func_02006e1c(w.handle);

    /* 16-byte block copy (ldmia/stmia) + dispatch (TRUNCATED past here) */
    blk[0] = ((int *)data_ov009_021adc00)[0];
    blk[1] = ((int *)data_ov009_021adc00)[1];
    blk[2] = ((int *)data_ov009_021adc00)[2];
    blk[3] = ((int *)data_ov009_021adc00)[3];
    func_0201e7e0();
    /* sp[0]=0; sp[4]=1; sp[8]=&blk; ... remainder of body not in supplied asm */
}
