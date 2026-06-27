/* CAMPAIGN-PREP candidate for func_021b5c2c (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class C: int v param -> mvn; literal call sequence; ushort[] view mirror loop
 *   risk:       VERIFIED main loop byte-identical (int-v gives `mvn r7,#0`, consts hoisted). Residual: trailing mirror loop base-hoist + add/cmp in-loop scheduling vs orig 2-add `add sl,r2,lsl#1` — scheduling, permuter-class.
 *   confidence: med
 */
/* func_ov006_021b5c2c (ov006, class C): board/state init.
 * Zero a 0xca98 region, run 4 sub-inits, snapshot 0x124 bytes, seed a
 * 5-slot table, then a 5x7 cell fill, a pass, and a halfword mirror loop.
 * Original hoists the loop-invariant cc0 column constants (-1,1,2,3,4)
 * into callee-saved regs across the i-loop. */

extern void Fill32(int value, void *dst, int size);
extern void Copy32(void *dst, void *src, int n);
extern int  func_ov006_021b7c94(int unused, int idx, unsigned short value);
extern int  func_ov006_021b7cc0(int unused, int i, int j, int v);
extern void func_ov006_021b7b78(void *p);
extern void func_ov006_021b8a88(void *p);
extern void func_ov006_021b8bf4(void *p);
extern void func_ov006_021b8d30(void *p);
extern void func_ov006_021b8de0(void *p);

extern char data_02105a4c[];
extern char data_ov006_0224f448[];

int func_ov006_021b5c2c(char *p) {
    int i;
    int k;
    unsigned short *b;

    Fill32(0, data_ov006_0224f448, 0xca98);
    func_ov006_021b8d30(p);
    func_ov006_021b8de0(p);
    func_ov006_021b8a88(p);
    func_ov006_021b8bf4(p);
    Copy32(data_02105a4c, p, 0x124);

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

    func_ov006_021b7b78(p);

    b = (unsigned short *)(p + 0x8100);
    for (k = 0; k < 5; k++)
        b[k + 0x3a] = b[k + 0x35];   /* 0x74>>1=0x3a, 0x6a>>1=0x35 */
    return 1;
}
