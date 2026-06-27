/* CAMPAIGN-PREP candidate for func_02231250 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     byte-pack (a&1)|(field<<8) as u16; reload f2 each use (orig re-ldrh); bitfield slot:5
 *   risk:       reshape-able+truncation: asm cut off before .L_328 return, so tail return/last call args are guessed; arg order to d7054/d5d48 may swap. struct-guessed fields.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_02231250 (ov002, class D) - brief 494.
 * UNVERIFIED build-free draft. ASM IS TRUNCATED (ends mid-tail at bne .L_328 with
 * no .L_328 body). Bitfield pack/unpack of f2 fields fed to a 021d7054 / 021d5d48
 * pair: low byte = (f2&1), high byte = (f2>>1)&0x1f or helper-returned byte.
 */
typedef unsigned short u16;

extern int  func_ov002_021bd030(int a);
extern int  func_ov002_021c1d28(int a, int b, int c);
extern void func_ov002_021d5d48(u16 a, u16 b);
extern void func_ov002_021d7054(u16 a, u16 b);
extern void func_ov002_02210104(void);
extern int  func_ov002_0223de94(char *obj, int b);
extern int  func_ov002_0223df38(int a, int b, int c);
extern int  func_ov002_0225764c(char *obj, int lo, int hi);

struct Obj1250 { char _0[2]; u16 b0:1; u16 slot:5; u16 _:10; };

int func_ov002_02231250(char *obj) {
    u16 f2 = *(u16 *)(obj + 2);
    int lo, hi, bd, kind;

    if (((f2 << 0x14) >> 0x1a) == 2) {
        func_ov002_02210104();
        return 0;
    }
    if (func_ov002_0223df38(0, 0, 0) == 0)
        return 0;
    kind = func_ov002_0223de94(obj, 0);
    lo = kind & 0xff;
    hi = (kind >> 8) & 0xff;
    if (func_ov002_0225764c(obj, lo, hi) == 0)
        return 0;
    bd = func_ov002_021bd030((f2 << 0x1f) >> 0x1f);
    if (bd < 0)
        return 0;
    f2 = *(u16 *)(obj + 2);
    func_ov002_021d7054((u16)((f2 & 1) | (((f2 >> 1) & 0x1f) << 8)),
                        (u16)((f2 & 1) | ((bd & 0xff) << 8)));
    f2 = *(u16 *)(obj + 2);
    func_ov002_021d5d48((u16)((f2 & 1) | ((bd & 0xff) << 8)),
                        (u16)((lo & 0xff) | ((hi & 0xff) << 8)));
    f2 = *(u16 *)(obj + 2);
    if (lo == ((f2 << 0x1f) >> 0x1f))
        return 0;
    func_ov002_021c1d28(lo, hi, 1);
    return 0;
}
