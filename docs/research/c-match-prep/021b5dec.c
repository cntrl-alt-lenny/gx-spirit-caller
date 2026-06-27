/* CAMPAIGN-PREP candidate for func_021b5dec (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class C: int v param -> mvn; literal call sequence; ushort[] view mirror loop
 *   risk:       VERIFIED prologue+5x7 loop byte-identical through .L_138. Sole residual: mirror loop hoists base to r3 (1 add/iter) vs orig non-hoisted 2-add + add/cmp scheduling — reshape base-expr, else permuter-class.
 *   confidence: high
 */
/* func_ov006_021b5dec (ov006, class C): sibling of 021b5c2c, lighter init
 * (no 021b8de0, no 0x124 snapshot). Same 5x7 cell fill with hoisted column
 * constants and the same trailing halfword mirror loop. */

extern void Fill32(int value, void *dst, int size);
extern int  func_ov006_021b7c94(int unused, int idx, unsigned short value);
extern int  func_ov006_021b7cc0(int unused, int i, int j, int v);
extern void func_ov006_021b8a88(void *p);
extern void func_ov006_021b8bf4(void *p);
extern void func_ov006_021b8d30(void *p);

extern char data_ov006_0224f448[];

int func_ov006_021b5dec(char *p) {
    int i;
    int k;
    unsigned short *b;

    Fill32(0, data_ov006_0224f448, 0xca98);
    func_ov006_021b8d30(p);
    func_ov006_021b8a88(p);
    func_ov006_021b8bf4(p);

    func_ov006_021b7c94((int)p, 0, 0);
    func_ov006_021b7c94((int)p, 1, 1);
    func_ov006_021b7c94((int)p, 2, 1);
    func_ov006_021b7c94((int)p, 3, 1);
    func_ov006_021b7c94((int)p, 4, 1);

    for (i = 0; i < 5; i++) {
        func_ov006_021b7cc0((int)p, i, 0, -1);
        func_ov006_021b7cc0((int)p, i, 1, -1);
        func_ov006_021b7cc0((int)p, i, 2, -1);
        func_ov006_021b7cc0((int)p, i, 3, -1);
        func_ov006_021b7cc0((int)p, i, 4, -1);
        func_ov006_021b7cc0((int)p, i, 5, -1);
        func_ov006_021b7cc0((int)p, i, 6, -1);
    }

    b = (unsigned short *)(p + 0x8100);
    for (k = 0; k < 5; k++)
        b[k + 0x3a] = b[k + 0x35];   /* 0x74>>1=0x3a, 0x6a>>1=0x35 */
    return 1;
}
