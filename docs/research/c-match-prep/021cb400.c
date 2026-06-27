/* CAMPAIGN-PREP candidate for func_021cb400 (ov012, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: bind mla base to one local; sign-ext byte via (x<<16)>>24; inline i*8 product; store order +0x174 then +0x175.
 *   risk:       reshape-able: orig holds base(r8) and table(r7) bound across the loop; if mwcc reloads either, the per-iter ldr addressing diverges. Fix via the bound locals shown.
 *   confidence: low
 */
/* func_ov012_021cb400: per-entry init of 4 sub-slots. base = &arr[idx] (stride 0x28);
 * derives a sign-extended seed byte from a global word table, runs a 4-iter loop
 * that draws (0202c0c0), formats (021adf18), measures (021add24), and writes two
 * packed bytes per slot. */
extern unsigned char data_ov000_021b56b4[];   /* stride 0x28 records */
extern short        data_ov012_021cc120[];    /* word-indexed seed table (signed byte payload) */
extern unsigned char data_ov012_021cc6dc[];   /* output byte pairs at +0x174/+0x175 */
extern int  func_0202c0c0(int code);
extern void func_ov000_021adf18(int a0, int idx, void *buf);
extern int  func_ov000_021add24(void *buf, int a1, int a2);

struct slot { char _p[8]; short hi; };        /* +0xa within an 8-byte stride */

void func_ov012_021cb400(int idx, int sel)
{
    struct slot *base = (struct slot *)(data_ov000_021b56b4 + idx * 0x28);
    int seed = ((int)((unsigned)data_ov012_021cc120[sel] << 16) >> 24);
    int glyph = seed + 0x21;
    int i;
    char buf[0x40];

    for (i = 0; i < 4; i++) {
        int adv;
        func_0202c0c0(glyph + 0x500);
        func_ov000_021adf18(0, i, buf);
        adv = func_ov000_021add24(buf, 0xc, 0x100);
        data_ov012_021cc6dc[i * 2 + 0x174] = (unsigned char)(adv - 0xa);
        data_ov012_021cc6dc[i * 2 + 0x175] = (unsigned char)(((short *)((char *)base + i * 8))[5] + 6);
    }
}
