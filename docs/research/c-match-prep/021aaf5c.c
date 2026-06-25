/* CAMPAIGN-PREP candidate for func_021aaf5c (ov021, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: precompute reserved ids r4/r5/r6, i in r8, count-1 bound
 *   risk:       reserved-id chain cmp/cmpne ordering: orig is r6,r5,r4 (0x1386,0x1387,0x1388) — || order must match that reg-alloc; also k held vs reloaded for the array store. reshape-able (reorder || / reload k).
 *   confidence: med
 */
/* func_ov021_021aaf5c: zero the 0x19c work block, seed header fields, Task_PostLocked,
 * then scan ids 1..N-1 collecting those that pass three filters (0202e2f8==0,
 * not one of the 3 reserved tail ids, 0202bb20!=0) into the +0x58 array until +0x5c hits 0x44c.
 * (ov021) class C: i held in r8, reserved ids precomputed in r4/r5/r6. */
extern void Fill32(int val, void *dst, int n);
extern int Task_PostLocked(int a, int b);
extern int data_ov021_0222cf44;
extern int data_021040ac;
extern int data_020b4768;
extern int func_0202b0e0(int a);
extern int func_0202bb20(int a);
extern int func_0202e2f8(int a);

int func_ov021_021aaf5c(char *o) {
    int n = data_020b4768;
    int i;
    Fill32(0, &data_ov021_0222cf44, 0x19c);
    *(int *)(o + 0x38) = 0;
    *(int *)(o + 0x40) = 0;
    *(int *)(o + 0x44) = 0;
    *(int *)(o + 0x48) = 0;
    *(int *)(o + 0x4c) = 0;
    *(int *)(o + 0x54) = (unsigned short)*(int *)((char *)&data_021040ac + 0x38);
    *(int *)(o + 0x58) = Task_PostLocked(0x1130, 4);
    *(int *)(o + 0x5c) = 0;
    for (i = 0; i < n - 1; i++) {
        int id = func_0202b0e0(i + 1);
        if (func_0202e2f8(id) != 0)
            continue;
        if (id == 0x1386 || id == 0x1387 || id == 0x1388)
            continue;
        if (func_0202bb20(id) == 0)
            continue;
        {
            int k = *(int *)(o + 0x5c);
            *(int *)(o + 0x5c) = k + 1;
            ((int *)*(int *)(o + 0x58))[k] = id;
            if (*(int *)(o + 0x5c) >= 0x44c)
                break;
        }
    }
    return 1;
}
