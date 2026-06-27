/* CAMPAIGN-PREP candidate for func_0200ac60 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind fc/f8 (each used twice); reload fe after store; clean C single-pointer base
 *   risk:       permuter-class/artifact: orig loads the base TWICE — a reloc `data_02186a58` for the guard AND a raw `.word 0x02186a58` (the note: 'bypasses patcher trim'). Clean C CSEs to ONE reloc'd literal, so the literal pool diverges; likely stays .s.
 *   confidence: low
 */
/* func_0200ac60: guard on first word, bump s16 counter fe; if fe<fc run the geometry
   call-chain else reset; store result to f4 and push it via func_0208e2f4(0x4000050,3,f4).
   NOTE: orig loads the base address TWICE (one reloc `data_02186a58`, one raw `.word 0x02186a58`). */
extern int  func_020b319c(int x);
extern int  func_020b2d2c(int a, int b);
extern void func_020b31e4(int a, int b);
extern int  func_020b3168(void);
extern void func_0208e2f4(int dst, int mode, int v);

typedef struct S02186a58 {
    int   f0;     /* +0x00 flag, also cleared */
    int   f4;     /* +0x04 result */
    short f8;     /* +0x08 */
    short fa;     /* +0x0a */
    short fc;     /* +0x0c */
    short fe;     /* +0x0e counter */
} S02186a58;
extern S02186a58 data_02186a58;

void func_0200ac60(void)
{
    S02186a58 *p = &data_02186a58;
    int fc, f8, e, t;
    if (p->f0 == 0)
        return;
    fc = p->fc;
    p->fe = p->fe + 1;
    e = p->fe;                 /* reload sign-extends the stored halfword */
    if (e < fc) {
        t  = func_020b2d2c(func_020b319c(e), func_020b319c(fc));
        f8 = p->f8;
        func_020b31e4(t, func_020b319c(p->fa - f8));
        t  = f8 + func_020b3168();
    } else {
        p->f0 = 0;
        t = p->fa;
    }
    p->f4 = t;
    func_0208e2f4(0x4000050, 3, p->f4);
}
