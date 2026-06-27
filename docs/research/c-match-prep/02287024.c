/* CAMPAIGN-PREP candidate for func_02287024 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order r6/r4/sl/r9/r5/r8; bind base+stride; sel=(1-bit)&1; repeated bl re-emitted
 *   risk:       struct-guessed: Slot field offsets 0x30/0x38 vs inner stride 0x14 inferred; also movs r7 fuses the lsr#19 test+value into one — mwcc may split (reshape-able).
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef struct Ent { u16 f0; u16 f2; } Ent;

/* per-sel block stride 0x868; inner walk stride 0x14 over fields at +0x30/+0x38 */
typedef struct Slot {
    u8  pad0[0x30];
    u32 f30;            /* low :13 used */
    u8  pad34[4];
    u16 f38;
} Slot;

extern u8 data_ov002_022cf16c[];   /* [2][0x868] backing store */
extern int func_0202b890(int x);

int func_ov002_02287024(Ent *e)
{
    int last;            /* r6 */
    u8 *base;            /* r4 = &data_022cf16c */
    int stride;          /* sl = 0x868 */
    Ent *ent;            /* r9 */
    int i;               /* r5 */
    int off;             /* r8 = i*0x14 */

    last = 0;
    base = data_ov002_022cf16c;
    stride = 0x868;
    ent = e;
    i = 0;
    off = 0;
    for (i = 0; i <= 4; i++, off += 0x14) {
        int sel = (1 - (ent->f2 & 1)) & 1;
        Slot *s = (Slot *)(base + sel * stride + off);
        int v = (s->f30 << 0x13) >> 0x13;
        if (v != 0 && s->f38 != 0) {
            if (last != func_0202b890(v)) {
                if (func_0202b890(v) <= 6) {
                    if (last != 0) return 1;
                    last = func_0202b890(v);
                }
            }
        }
    }
    return 0;
}
