/* CAMPAIGN-PREP candidate for func_021aa5f0 (ov008, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order: i,row early; keep r4=0x64 / r5=base hoisted; inner addne via post-increment then test
 *   risk:       reshape-able: the inner loop loads buf[n] twice (pre/post addne) and r9 init = fp; if mwcc rematerializes buf[n] differently the addne/cmp pairing diverges — may need to split the two reads explicitly as written.
 *   confidence: low
 */
/* func_ov008_021aa5f0: outer count loop, inner non-NULL scan, scaled
   accumulate, store result per row. cls C (nested loop reg-alloc). */

extern unsigned short data_ov008_021b2c80[]; /* _LIT0, [.. + 0x5a] count */
extern unsigned short data_ov008_021b2780[]; /* _LIT1, walked +0x34/row */

extern void func_0202b6e4(int a0, int *buf, int a2, int a3);
extern int  func_0202bb20(int item);
extern int  func_020b3870(int num, int den);

typedef struct {
    char _pad10[0x10];
    unsigned short f10;   /* 0x10 */
    char _pad12[0x14 - 0x12];
    int  f14;             /* 0x14 result store */
    char _pad18[0x34 - 0x18];
} Row_021aa5f0;

void func_ov008_021aa5f0(void)
{
    Row_021aa5f0 *row;
    int i;
    int buf[0x3c];   /* sp..; 0xf0 bytes */

    i = 0;
    if (((unsigned short *)data_ov008_021b2c80)[0x5a / 2] == 0)
        return;
    row = (Row_021aa5f0 *)data_ov008_021b2780;
    do {
        int n;
        int hits;
        func_0202b6e4(row->f10, buf, 0x3c, 0);
        hits = 0;
        n = 0;
        if (buf[0] != 0) {
            do {
                func_0202bb20(buf[n]);
                n++;
                if (buf[n] != 0)
                    hits++;
            } while (buf[n] != 0);
        }
        if (n == 0) {
            row->f14 = 0;
        } else {
            row->f14 = func_020b3870(hits * 0x64, n);
        }
        i++;
        row = (Row_021aa5f0 *)((char *)row + 0x34);
    } while (i < ((unsigned short *)data_ov008_021b2c80)[0x5a / 2]);
}
