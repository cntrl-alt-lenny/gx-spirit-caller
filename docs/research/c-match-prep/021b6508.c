/* CAMPAIGN-PREP candidate for func_021b6508 (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class C: two separate i-loops; first guarded (i!=0); int v -> mvn second loop
 *   risk:       reshape-able/permuter-class: first loop reuses r5/r4 across the i!=0 guard; risk is whether mwcc reuses one counter+0 for both i and j-const like orig (mov r4,r5). Second 5x7 loop matches pattern; mirror-loop tail scheduling is the same permuter residual.
 *   confidence: med
 */
/* func_ov006_021b6508 (ov006, class C): two-phase init. First a guarded
 * per-row call (i!=0) via 021b843c, a handle reset, then the full 5x7 cc0
 * seed loop and the trailing halfword mirror loop. */

extern void Fill32(int value, void *dst, int size);
extern void Copy32(void *dst, void *src, int n);
extern void func_020124a4(int handle, void *p);
extern int  func_ov006_021b843c(int unused, int i, int j);
extern int  func_ov006_021b7c94(int unused, int idx, unsigned short value);
extern int  func_ov006_021b7cc0(int unused, int i, int j, int v);
extern void func_ov006_021b7bb0(void *p, int i);
extern void func_ov006_021b7cfc(void *p);
extern void func_ov006_021b7e80(void *p);
extern void func_ov006_021b8bf4(void *p);
extern void func_ov006_021b8d30(void *p);

extern char data_02105a4c[];
extern char data_ov006_0224f448[];

int func_ov006_021b6508(char *p) {
    int i;
    int k;
    unsigned short *b;

    Fill32(0, data_ov006_0224f448, 0xca98);
    func_ov006_021b8d30(p);
    func_ov006_021b8bf4(p);
    Copy32(data_02105a4c, p, 0x124);
    func_ov006_021b7cfc(p);
    func_ov006_021b7e80(p);

    for (i = 0; i < 5; i++) {
        if (i == 0)
            continue;
        func_ov006_021b843c((int)p, i, 0);
    }

    func_020124a4(0, p);
    func_ov006_021b7e80(p);

    for (i = 0; i < 5; i++) {
        func_ov006_021b7c94((int)p, i, 0);
        func_ov006_021b7cc0((int)p, i, 0, -1);
        func_ov006_021b7cc0((int)p, i, 1, -1);
        func_ov006_021b7cc0((int)p, i, 2, -1);
        func_ov006_021b7cc0((int)p, i, 3, -1);
        func_ov006_021b7cc0((int)p, i, 4, -1);
        func_ov006_021b7cc0((int)p, i, 5, -1);
        func_ov006_021b7cc0((int)p, i, 6, -1);
        func_ov006_021b7bb0(p, i);
    }

    b = (unsigned short *)(p + 0x8100);
    for (k = 0; k < 5; k++)
        b[k + 0x3a] = b[k + 0x35];   /* 0x74>>1=0x3a, 0x6a>>1=0x35 */
    return 1;
}
