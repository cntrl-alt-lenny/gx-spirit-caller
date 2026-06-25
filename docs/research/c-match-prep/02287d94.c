/* CAMPAIGN-PREP candidate for func_02287d94 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     movs r5 (lim) gate-then-store; load f38 before f30 (asm order); mla index; bind base/stride
 *   risk:       struct-guessed + reshape-able: asm loads f30 then f38 but tests f38 first (cmp r1; cmpne r2) — declaring g=f38 before v=f30 may reorder the two ldr; keep ldr(f30) then ldrh(f38) emission order.
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef struct Ent { u16 f0; u16 f2; } Ent;

typedef struct Slot {
    u8  pad0[0x30];
    u32 f30;
    u8  pad34[4];
    u16 f38;
} Slot;

extern u8 data_ov002_022cf16c[];
extern int func_ov002_021c325c(int a);
extern int func_ov002_021c84e0(int a, int b);

int func_ov002_02287d94(Ent *e)
{
    Ent *ent;            /* r8 */
    int lim;             /* r5 */
    int i;               /* r6 */
    u8 *base;            /* r4 */
    int stride;          /* r9 */
    int off;             /* r7 */

    ent = e;
    lim = func_ov002_021c325c(ent->f2 & 1);
    if (lim != 0) {
        base = data_ov002_022cf16c;
        stride = 0x868;
        off = 0;
        for (i = 0; i < 5; i++, off += 0x14) {
            int sel = (1 - (ent->f2 & 1)) & 1;
            Slot *s = (Slot *)(base + sel * stride + off);
            u16 g = s->f38;
            int v = (s->f30 << 0x13) >> 0x13;
            if (g != 0 && v != 0) {
                int r = func_ov002_021c84e0(i, 0 /*sel?*/);
                if (r != 0 && r <= lim) return 1;
            }
        }
    }
    return 0;
}
