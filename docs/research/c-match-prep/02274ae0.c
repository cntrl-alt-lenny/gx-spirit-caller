/* CAMPAIGN-PREP candidate for func_02274ae0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class C guard-chain; id held r4 across loop; bind ce288 base
 *   risk:       reshape-able: orig binds id (021b9ecc result) in callee-saved r4 across the scan loop; the loop re-derives ce288+0x6a4 count each iter (movs in orig, not hoisted) — if mwcc hoists count to a reg the cmp source diverges. Move count read inside the for-condition (done).
 *   confidence: med
 */
/* func_ov002_02274ae0: guard-chain validator + linear scan of the ce288
 * id-array (count@+0x6a4, ints@+0x6b4). Returns 0x800 on a hit, else 0.
 * cd300: bit0:1 @word0, byte@+8 flag held across two reads (bind base).  */
typedef unsigned short u16;
struct CD300 { unsigned bit0:1; unsigned rest:31; /*0*/ };
extern char data_ov002_022cd300[];
extern char data_ov002_022ce288[];
extern int func_ov002_021b9ecc(int sum);
extern int func_ov002_021bc288(int who, int sum);
extern int func_ov002_021bc618(int bit0);
extern int func_ov002_021bd710(int who, int sum);
int func_ov002_02274ae0(int who, int a, int b) {
    int sum = a + b;
    int id;
    int i;
    int *arr;
    if (sum > 10) return 0;
    if (who != (int)((struct CD300 *)data_ov002_022cd300)->bit0) return 0;
    id = func_ov002_021b9ecc(sum);
    if (id == 0) return 0;
    if (func_ov002_021bd710(who, sum) != 0) return 0;
    if (data_ov002_022cd300[0x8] == 0) {
        if (func_ov002_021bc618((int)((struct CD300 *)data_ov002_022cd300)->bit0) == 0) {
            if (func_ov002_021bc288(who, sum) == 0) return 0;
        }
    }
    arr = (int *)(data_ov002_022ce288 + 0x6b4);
    for (i = 0; i < *(int *)(data_ov002_022ce288 + 0x6a4); i++) {
        if (id == arr[i]) return 0x800;
    }
    return 0;
}
