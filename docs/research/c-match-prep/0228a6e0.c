/* CAMPAIGN-PREP candidate for func_0228a6e0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     byte-unpack r0: lo=r&0xff hi=(u16 r)>>8; bind tbl base; reload count
 *   risk:       hi byte uses (r<<16>>16)>>8 i.e. (u16)r>>8; tbl index r5*4 then ldrh = u16[idx*2] with <<19>>19. struct-guessed (count at +6 byte, tbl elem stride). reshape-able if unpack order off.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;

typedef struct { u16 unk0; u16 sel; u8 unk4; u8 unk5; u8 count; } Ctx;

extern u16 data_ov002_022d0250[];
extern char data_ov002_022cd524[];
extern int func_0202b878(int);
extern int func_ov002_0223de94(Ctx *, int);
extern int func_ov002_0223def4(Ctx *, int);

int func_ov002_0228a6e0(Ctx *a, Ctx *b)
{
    s32 i;
    u16 *tbl;
    s32 idx;
    int r;

    if (b == 0)
        return 0;
    if ((b->sel & 1) == (a->sel & 1))
        return 0;
    i = 0;
    if ((s32)(u8)b->count > 0) {
        tbl = data_ov002_022d0250;
        do {
            r = func_ov002_0223de94(b, i);
            if ((r & 0xff) != (a->sel & 1)) {
                if (((u16)r >> 8 & 0xff) == 0xe) {
                    idx = func_ov002_0223def4(b, i);
                    if (func_0202b878((tbl[idx * 2] << 19) >> 19) == 0x16) {
                        *(s32 *)(data_ov002_022cd524 + 0x10) = idx;
                        return 1;
                    }
                }
            }
            i++;
        } while (i < (s32)(u8)b->count);
    }
    return 0;
}
