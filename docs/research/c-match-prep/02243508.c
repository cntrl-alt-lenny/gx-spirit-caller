/* CAMPAIGN-PREP candidate for func_02243508 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mode :8 bitfield; (r4&ff)|(r6&ff)<<8 byte-pack; lo1 :1
 *   risk:       mode extract is lsl#0x10;lsr#0x18 = bits8..15 of halfword at 0x6, modeled as a :8 field after a low :8 pad. struct-guessed (offset/field-width of 0x6 halfword unverified).
 *   confidence: med
 */
// func_ov002_02243508  ov002  guard-chain comparator, byte-pack

typedef unsigned short u16;
typedef unsigned char  u8;

struct Obj02243508 {
    u16 field0;        // [0x0]
    u16 lo1 : 1;       // [0x2] bit0
    u16 pad2 : 15;
    u16 mode : 8;      // [0x6] byte: (h<<0x10)>>0x18  == bits 8..15? -> lsl16 lsr24 = bits 8..15
    u16 padhi : 8;
};

extern int  func_ov002_022575c8(void *obj, int a, int b);
extern int  func_ov002_0223de94(void *obj, int z);

int func_ov002_02243508(struct Obj02243508 *obj, int r4, int r6)
{
    int mode;
    if (func_ov002_022575c8(obj, r4, r6) == 0)
        return 0;
    mode = obj->mode;
    if (mode == 0) {
        if (obj->lo1 != r4)
            return 1;
        return 0;
    }
    if (mode == 1) {
        u16 packed = (u16)((r4 & 0xff) | ((r6 & 0xff) << 8));
        if (func_ov002_0223de94(obj, 0) == packed)
            return 0;
        return 0;
    }
    if (mode == 2) {
        if (r4 == obj->lo1)
            return 1;
        return 0;
    }
    return 0;
}
