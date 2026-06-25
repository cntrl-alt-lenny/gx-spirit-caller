/* CAMPAIGN-PREP candidate for func_021ff46c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     key=b0^b15 eor (b0 first); guard 021ff3bc; (key&1)*0x868 count gate via cf178; row.f0c loop bcc
 *   risk:       reshape-able: orig computes `r1=(key&1)*0x868` ONCE and reuses it for both cf178 (count gate) and cf16c (row base, _LIT2+r1) — must share that index. If mwcc recomputes (key&1)*0x868 for cf16c, an extra mul/add diverges. eor operand order (b0^b15) picks dest reg.
 *   confidence: low
 */
/* func_ov002_021ff46c (ov002, class C) — bit0^bit15 of +2 = key; require 021ff3bc(self);
 * per-player 0x868 list (cf178 count / cf16c rows at key&1) loop calling 022536e8 until a
 * hit (->1) or exhausted (->0). self r6, key r4. */
typedef unsigned short u16;

extern int  data_ov002_022cf178[];   /* per-player count table */
extern char data_ov002_022cf16c[];   /* per-player row table; row.f0c = count */
extern int  func_ov002_021ff3bc(void *self);
extern int  func_ov002_022536e8(int key, int f0, int i);

struct F021ff46c_F2 { u16 b0 : 1; u16 mid : 14; u16 b15 : 1; };
struct F021ff46c_Self { u16 f0; struct F021ff46c_F2 f2; };

int func_ov002_021ff46c(struct F021ff46c_Self *self) {
    int key = self->f2.b0 ^ self->f2.b15;
    int i, count;
    char *row;
    if (func_ov002_021ff3bc(self) == 0) return 0;
    count = *(int *)((char *)data_ov002_022cf178 + (key & 1) * 0x868);
    if (count == 0) return 0;
    row = data_ov002_022cf16c + (key & 1) * 0x868;
    for (i = 0; i < *(int *)(row + 0xc); i++) {
        if (func_ov002_022536e8(key, self->f0, i) != 0) return 1;
    }
    return 0;
}
