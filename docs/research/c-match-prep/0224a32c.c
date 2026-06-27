/* CAMPAIGN-PREP candidate for func_0224a32c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     getter==const then two single-bit :1 flag guards (bit18,bit20)
 *   risk:       struct-guessed/reshape-able: bit18 (lsl0xd;lsr0x1f) and bit20 (lsl0xb;lsr0x1f) flags inferred — must be :1 bitfields at those positions in the entry word. Orig re-loads [r5] for the flag tests; keep word in one local but extract two flags from it.
 *   confidence: med
 */
typedef struct Entry {
    unsigned int kind : 13; /* bits 0..12 */
    unsigned int      : 5;  /* bits 13..17 */
    unsigned int b18  : 1;  /* bit 18 */
    unsigned int      : 1;  /* bit 19 */
    unsigned int b20  : 1;  /* bit 20 */
    unsigned int      : 11;
} Entry;

extern unsigned char data_ov002_022cf16c[2][0x868];
extern int data_ov002_022cf180[2][0x868 / 4];

extern int func_0202b878(int x);
extern void func_ov002_02253458(int a, int b, int c);

extern void func_ov002_0224a32c(int arg0);

void func_ov002_0224a32c(int arg0)
{
    int side = arg0 & 1;
    int i;
    int count;
    unsigned char *base;
    Entry *p;

    if (data_ov002_022cf180[side][0] == 0)
        return;

    base = data_ov002_022cf16c[side];
    p = (Entry *)(base + 0x18 + 0x400);
    i = 0;
    count = *(int *)(base + 0x14);
    do {
        if (func_0202b878(p->kind) == 0x16) {
            if (p->b18 != 0) {
                if (p->b20 == 0)
                    func_ov002_02253458(arg0, 0xe, i);
            }
        }
        count = *(int *)(base + 0x14);
        i++;
        p++;
    } while (i < count);
}
