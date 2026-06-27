/* CAMPAIGN-PREP candidate for func_0201b504 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     func fills array+count; loop (idx-1)*0x18 mla; two bitfields at elem+8 store-order; byte-accum sys+0x8f8
 *   risk:       permuter-class + struct-guessed: the elem layout (pad[8]+f0:8+f9:8 at bit 9, stride 0x18) and the double-store-with-intermediate-mask (and r2,0xfffe01ff) are inferred; reg-alloc over r4-r9 loop is likely to need permuter.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_0201b504 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. func_0201afdc fills a stack array + count; loop maps each
 * (u16) entry via func_02019210 to a 1-based index into a 24-byte-stride struct array at sys,
 * packs two bitfields at elem+0x8 (byte0 = arg&0xff, then :8 field at bit 9 = entry low byte),
 * then accumulates count into the low byte of sys+0x8f8 (& 0xff, no clamp).
 */
extern char *GetSystemWork(void);
extern int func_02019210(int);
extern void func_0201afdc(int, int, unsigned short *, int *);

struct elem {
    char pad[8];
    unsigned f0 : 8;    /* bits 0-7  = arg & 0xff   */
    unsigned f9 : 8;    /* bits 9-16 = entry low byte */
};

struct sysf8 { unsigned lo8 : 8; unsigned rest : 24; };

void func_0201b504(int arg) {
    char *sys = GetSystemWork();
    unsigned short buf[16];
    int count = 0;
    int i;
    func_0201afdc(arg, 1, buf, &count);
    for (i = 0; i < count; i++) {
        int idx = func_02019210((unsigned short)buf[i]);
        struct elem *e = (struct elem *)(sys + (idx - 1) * 0x18);
        e->f0 = arg & 0xff;
        e->f9 = (unsigned short)buf[i];
    }
    ((struct sysf8 *)(sys + 0x8f8))->lo8 = ((struct sysf8 *)(sys + 0x8f8))->lo8 + count;
}
