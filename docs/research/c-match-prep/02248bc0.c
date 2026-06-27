/* CAMPAIGN-PREP candidate for func_02248bc0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: lsl;lsr for :13 via shift expr; bind base, re-read count; walking u32* rec
 *   risk:       permuter-class: the hand-authored binary-search remap cmp-tree (computed bounds, subeq/addeq in-place) will NOT match a compiler-emitted switch; likely escapes to .s.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_02248bc0 (ov002, class D) — MED tier.
 * ANALYSIS-ONLY (build-free). Shape: value-remap of arg1 via a hand-authored
 * binary-search cmp-tree (computed bounds like 0x1293+0x75), then the standard
 * ov002 per-parity loop over data_ov002_022cf16c records: low-13 field nonzero
 * test via func_0202df78, conditional func_ov002_02253458(arg0,0xd,i).
 * po=(arg0&1)*0x868; guard reads count via the cf17c symbol (=cf16c+0x10); the
 * loop re-reads [base+0x10] each iter (matches separate relocs). Record stride 4,
 * array at base+0x260. low13 = ((unsigned)w<<19)>>19 to force lsl#0x13;lsr#0x13. */
typedef unsigned int u32;

extern int  data_ov002_022cf17c[];               /* = cf16c+0x10 (count), per-parity */
extern char data_ov002_022cf16c[];               /* per-parity 0x868 block */
extern int  func_0202df78(int low13, int remap);
extern void func_ov002_02253458(int arg0, int kind, int idx);

void func_ov002_02248bc0(int arg0, int arg1) {
    char *base;
    u32 *rec;
    int i, n;
    int po = (arg0 & 1) * 0x868;

    /* value remap of arg1 */
    if (arg1 > 0x139d) {
        if (arg1 > 0x180c) {
            if (arg1 == 0x180c + 0x93) arg1 = 0x180c + 0x97;
        } else if (arg1 >= 0x180c - 5) {
            if (arg1 == 0x180c - 5)      arg1 = 0x180c - 1;
            else if (arg1 == 0x180c - 1) arg1 = 0x180c;
            else if (arg1 == 0x180c)     arg1 = 0x180c - 5;
        }
    } else if (arg1 == 0x139d) {
        arg1 = 0xfe4;
    } else if (arg1 > 0x1293) {
        if (arg1 == 0x1293 + 0x75) arg1 = 0x1293 + 0x52;
    } else if (arg1 == 0x1293) {
        arg1 = 0x1293 - 2;
    }

    if (*(int *)((char *)data_ov002_022cf17c + po) == 0)
        return;
    base = data_ov002_022cf16c + po;
    rec = (u32 *)(base + 0x260);
    i = 0;
    do {
        if (func_0202df78((int)(((u32)*rec << 19) >> 19), arg1) != 0)
            func_ov002_02253458(arg0, 0xd, i);
        n = *(int *)(base + 0x10);
        i++;
        rec++;
    } while ((u32)i < (u32)n);
}
