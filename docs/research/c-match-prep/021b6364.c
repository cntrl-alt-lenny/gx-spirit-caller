/* CAMPAIGN-PREP candidate for func_021b6364 (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class C: unsigned (i-1)>1 range guard; int v -> mvn; ushort[] view mirror loop
 *   risk:       reshape-able/permuter-class: guard `(unsigned)(i-1)>1` should give sub;cmp#1;bhi (matches), and int-v gives mvn; residual is the same mirror-loop base-hoist + tail scheduling as 021b5dec. The handle init `func_020124a4(*(data_021040ac+0xc3c),p)` is struct-guessed at +0xc3c.
 *   confidence: med
 */
/* func_ov006_021b6364 (ov006, class C): init that seeds only rows i==1,2
 * (unsigned range test (i-1)<=1), with a main-table handle init in between,
 * then the trailing halfword mirror loop. */

extern void Fill32(int value, void *dst, int size);
extern void func_020124a4(int handle, void *p);
extern int  func_ov006_021b7c94(int unused, int idx, unsigned short value);
extern int  func_ov006_021b7cc0(int unused, int i, int j, int v);
extern void func_ov006_021b7bb0(void *p, int i);
extern void func_ov006_021b7cfc(void *p);
extern void func_ov006_021b7e80(void *p);
extern void func_ov006_021b8bf4(void *p);
extern void func_ov006_021b8d30(void *p);

extern char data_021040ac[];
extern char data_ov006_0224f448[];

int func_ov006_021b6364(char *p) {
    int i;
    int k;
    unsigned short *b;

    Fill32(0, data_ov006_0224f448, 0xca98);
    func_ov006_021b8d30(p);
    func_ov006_021b8bf4(p);
    func_020124a4(*(int *)(data_021040ac + 0xc3c), p);

    *(int *)(p + 0x6294) = 1;
    func_ov006_021b7cfc(p);
    func_ov006_021b7e80(p);
    *(int *)(p + 0x6294) = 0;

    for (i = 0; i < 5; i++) {
        if ((unsigned int)(i - 1) > 1)
            continue;
        func_ov006_021b7c94((int)p, i, 1);
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
