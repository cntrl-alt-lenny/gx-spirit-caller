/* CAMPAIGN-PREP candidate for func_0228ae94 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two de94 calls; hi=(u16 r)>>8&0xff range-test; lo=r&0xff equality; bhi unsigned
 *   risk:       first hi-byte test is unsigned bhi vs #0xa; second branch tests lo==sel via bne (so equal falls through). de94 called twice (not CSE'd). reshape-able if mwcc folds the duplicate call or signs the hi compare; keep two explicit calls + u8 hi.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef signed int s32;

typedef struct { u16 type; u16 sel; u8 unk4; u8 unk5; u8 count; } Ctx;

extern int func_0202b878(int);
extern int func_ov002_0223de94(Ctx *, int);
extern int func_ov002_022575c8(Ctx *);

int func_ov002_0228ae94(Ctx *a, Ctx *b)
{
    int r;

    if (b == 0)
        return 0;
    if ((b->sel & 1) == (a->sel & 1))
        return 0;
    if (func_0202b878(b->type) != 0x16)
        return 0;
    if ((s32)(u8)b->count == 1) {
        r = func_ov002_0223de94(b, 0);
        if ((s32)((u8)(((u16)r >> 8) & 0xff)) <= 0xa) {
            r = func_ov002_0223de94(b, 0);
            if ((r & 0xff) == (a->sel & 1)) {
                if (func_ov002_022575c8(a) != 0)
                    return 1;
            }
        }
    }
    return 0;
}
