/* CAMPAIGN-PREP candidate for func_0228a7c8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     twin of a6e0 sans table lookup; same byte-unpack lo/hi; reload count
 *   risk:       r3=(u16 r)>>8 then &0xff held across the !=0 / ==0xe branches; if mwcc recomputes the shift instead of holding r3, an extra mov diverges. reshape-able (single temp hi=((u16)r>>8)&0xff before both tests).
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;

typedef struct { u16 unk0; u16 sel; u8 unk4; u8 unk5; u8 count; } Ctx;

extern char data_ov002_022cd524[];
extern int func_ov002_0223de94(Ctx *, int);
extern int func_ov002_0223def4(Ctx *, int);

int func_ov002_0228a7c8(Ctx *a, Ctx *b)
{
    s32 i;
    int r;

    if (b == 0)
        return 0;
    if ((b->sel & 1) == (a->sel & 1))
        return 0;
    i = 0;
    if ((s32)(u8)b->count > 0) {
        do {
            r = func_ov002_0223de94(b, i);
            if ((r & 0xff) != (a->sel & 1)) {
                if (((u16)r >> 8 & 0xff) == 0xe) {
                    *(s32 *)(data_ov002_022cd524 + 0x10) = func_ov002_0223def4(b, i);
                    return 1;
                }
            }
            i++;
        } while (i < (s32)(u8)b->count);
    }
    return 0;
}
