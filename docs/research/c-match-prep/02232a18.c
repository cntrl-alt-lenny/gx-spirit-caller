/* CAMPAIGN-PREP candidate for func_02232a18 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla-form base+parity*0x868; bitfield decode; reload f2; guarded-call chain order
 *   risk:       truncation+struct-guessed: asm cut after 021b9bd4; the ret+1<3 branch body and final call are missing/guessed. mla vs mul base may flip operand order. confirm strides.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_02232a18 (ov002, class D) - brief 494.
 * UNVERIFIED build-free draft. ASM TRUNCATED (tail after 021b9bd4 cut off).
 * Guard (f4>>2)&1 then helper chain (df38/de94/0225764c/021d6808), THEN canonical
 * f2/f4 decode (mla form base+parity*0x868) + 021d9144 / 021b9bd4(parity,slot).
 */
typedef unsigned short u16;

extern char data_ov002_022cf16c[];   /* record table, +0x30 */
extern void func_ov002_021b9bd4(int parity, int slot);
extern void func_ov002_021d6808(int a, int lo, int hi, int sp0);
extern void func_ov002_021d9144(int a, int b, int c);
extern int  func_ov002_0223de94(char *obj, int b);
extern int  func_ov002_0223df38(int a, int b, int c);
extern int  func_ov002_0225764c(char *obj, int lo, int hi);

int func_ov002_02232a18(char *obj) {
    u16 f4 = *(u16 *)(obj + 4);
    u16 f2;
    int parity, slot, rec, A, B, lo, hi, kind;

    if (((f4 << 0x1d) >> 0x1f) == 0) {
        if (func_ov002_0223df38(0, 0, 0) != 0) {
            kind = func_ov002_0223de94(obj, 0);
            lo = kind & 0xff;
            hi = (kind >> 8) & 0xff;
            if (func_ov002_0225764c(obj, lo, hi) != 0)
                func_ov002_021d6808((int)obj, lo, hi, 1);
        }
    }
    f2 = *(u16 *)(obj + 2);
    f4 = *(u16 *)(obj + 4);
    parity = (f2 << 0x1f) >> 0x1f;
    slot = (f2 << 0x1a) >> 0x1b;
    rec = *(int *)(data_ov002_022cf16c + parity * 0x868 + 0x30 + slot * 0x14);
    A = (f4 << 0x11) >> 0x17;
    B = ((rec << 2) >> 0x18) * 2 + ((rec << 0x12) >> 0x1f);
    if (A != B)
        return 0;
    func_ov002_021d9144((int)obj, 0, 1);
    f2 = *(u16 *)(obj + 2);
    func_ov002_021b9bd4((f2 << 0x1f) >> 0x1f, (f2 << 0x1a) >> 0x1b);
    /* truncated: orig then if(ret+1<3) re-decodes f2 parity/slot ... */
    return 0;
}
