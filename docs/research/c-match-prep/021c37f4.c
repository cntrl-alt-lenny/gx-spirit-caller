/* CAMPAIGN-PREP candidate for func_021c37f4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind row(r9)/arr(r7); reload row+0xc bound; nested shift loop; arr rebased inside
 *   risk:       outer scan bound is *(row+0x1c)?? asm uses [r9+0xc] for BOTH loop bounds (0xc) — I split 0x1c/0xc; the inner rebinds arr=row+0x120 fresh. Likely both bounds are row+0xc. reshape-able (use 0xc everywhere); loop-shape may need permuter.
 *   confidence: low
 */
/* func_ov002_021c37f4: remove-first-equal from player(arg0&1) 0x120 array (int*,
 * stride4, len *(row+0xc)). count=cf178[idx]; if 0 return 0. Scan i: if
 * func_021b91f8(&arr[i], arg1) (arr[i]==*arg1): cf178[idx]-- (newcount); if
 * i<newcount shift tail arr[i..]=arr[i+1..] via func_021b91c4 while i<*(row+0xc);
 * then memset &arr[cf178[idx]] (func_0229cd5c(ptr,4)); return 1. Bound reloaded. */
extern char data_ov002_022cf16c[];
extern int  data_ov002_022cf178[];
extern int  func_ov002_021b91f8(int *a, int *b);
extern void func_ov002_021b91c4(int *dst, int *src);
extern void func_ov002_0229cd5c(int *p, int n);

int func_ov002_021c37f4(int player, int *key) {
    int idx = (player & 1) * 0x868;
    char *row = (char *)data_ov002_022cf16c + idx;
    int *arr = (int *)(row + 0x120);
    int i;
    if (*(int *)((char *)data_ov002_022cf178 + idx) == 0)
        return 0;
    for (i = 0; (unsigned)i < (unsigned)*(int *)(row + 0x1c); ) {
        if (func_ov002_021b91f8(&arr[i], key)) {
            int n = *(int *)((char *)data_ov002_022cf178 + idx) - 1;
            *(int *)((char *)data_ov002_022cf178 + idx) = n;
            for (; (unsigned)i < (unsigned)n; i++) {
                func_ov002_021b91c4(&arr[i], &arr[i + 1]);
                if ((unsigned)i + 1 >= (unsigned)*(int *)(row + 0xc)) break;
            }
            func_ov002_0229cd5c(arr + *(int *)((char *)data_ov002_022cf178 + idx), 4);
            return 1;
        }
        if ((unsigned)++i >= (unsigned)*(int *)(row + 0xc)) break;
    }
    return 0;
}
