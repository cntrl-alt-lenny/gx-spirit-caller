/* CAMPAIGN-PREP candidate for func_022325f8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     kind bitfield (<<0x1a>>0x1b); b arg (<<0x11>>0x17); mla bit*0x868; dup arms +0x418/+0x120; r3=self[0]<<16
 *   risk:       movs ip,r0; bmi shares slot reg across both arms; offsets 0x4(self[2]) and bit-extract widths struct-guessed. mwcc may schedule the two ldrh [r4,#2] reloads vs one bind differently. struct-guessed.
 *   confidence: low
 */
/* func_ov002_022325f8 : cls C - mla struct base, dup branches; reg-reuse recipe */

extern unsigned char data_ov002_022cf16c[2][0x868];
extern int  func_ov002_021b99b4(int side, int b);
extern int  func_ov002_021b9aa8(int side, int b);
extern int  func_ov002_021ca3f0(int side, int h0);
extern int  func_ov002_021ff3bc(void);
extern void func_ov002_0227adb8(void *p, int one, int rawlo, int zero);

int func_ov002_022325f8(unsigned short *self)
{
    int kind;
    int slot;

    if (func_ov002_021ff3bc() == 0)
        return 0;
    if (func_ov002_021ca3f0(self[1] & 1, self[0]) == 0)
        return 0;

    kind = (self[1] << 0x1a) >> 0x1b;
    if (kind == 0xe) {
        slot = func_ov002_021b99b4(self[1] & 1, (self[2] << 0x11) >> 0x17);
        if (slot < 0)
            return 0;
        func_ov002_0227adb8(
            (void *)(data_ov002_022cf16c[self[1] & 1] + 0x18 + 0x400 + slot * 4),
            1, self[0] << 0x10, 0);
    } else {
        slot = func_ov002_021b9aa8(self[1] & 1, (self[2] << 0x11) >> 0x17);
        if (slot < 0)
            return 0;
        func_ov002_0227adb8(
            (void *)(data_ov002_022cf16c[self[1] & 1] + 0x120 + slot * 4),
            1, self[0] << 0x10, 0);
    }
    return 0;
}
