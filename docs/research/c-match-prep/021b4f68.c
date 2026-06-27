/* CAMPAIGN-PREP candidate for func_021b4f68 (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :3 bitfield arg reload x4; ordered zero stores; :1 flag pack |=1
 *   risk:       reshape-able: the (data[1]&0x7) is a :3 bitfield (lsl;lsr) — model data_02104f4c[1] as a struct :3 member or the four reads become 'and' not lsl;lsr. The 0x1b>6 const-fold to 1 and g2[4] :1 RMW order must hold. struct-guessed bases.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov006_021b4f68 (ov006, class D) — brief 494.
 * UNVERIFIED build-free draft. recipe: linear init, 10 calls. Recurring arg
 * (data_02104f4c[1] & 0x7) is a :3 bitfield read (lsl#0x1d;lsr#0x1d) passed to
 * 4 funcs. Tail: zero G[0..8], G[0xc]=0x1b, then :1 flag pack at G2[0x10] |= 1
 * (since 0x1b>6). Store order preserved.
 */
extern unsigned int data_02104f4c[];           /* [1] = byte with :3 field    */
extern int  data_ov006_021cf1b0[];
extern int  data_ov006_0224f330[];             /* G3: [0xc]=0, [0]=2          */
extern int  data_ov006_0224f344[];
extern int  data_ov006_0224f380[];
extern int  data_ov006_0224f448[];
extern int  data_ov006_0225dc20[];             /* G2: [0..0xc], flags [0x10]  */
extern void func_020018d4(int a);
extern void func_0200197c(int a, void *b, int c);
extern void func_02001d68(int a);
extern void func_0202adf8(void *a);
extern void func_0202ae1c(int a);
extern void func_0202c070(int a);
extern void func_0202c24c(void *a);
extern void func_0202c270(int a);
extern void func_020373cc(int a, int b);
extern void func_ov006_021b5dec(void *a);

int func_ov006_021b4f68(void) {
    int *g2;

    func_0202adf8(data_ov006_0224f344);
    func_0202ae1c(data_02104f4c[1] & 0x7);
    func_0202c070(data_02104f4c[1] & 0x7);
    func_0202c24c(data_ov006_0224f380);
    func_0202c270(data_02104f4c[1] & 0x7);
    func_020018d4(0xa0);
    func_0200197c(0x4, data_ov006_021cf1b0, 0x80000);
    func_02001d68(data_02104f4c[1] & 0x7);
    func_ov006_021b5dec(data_ov006_0224f448);

    g2 = data_ov006_0225dc20;
    g2[0] = 0;
    g2[1] = 0;
    g2[2] = 0;
    g2[3] = 0x1b;
    g2[4] = (g2[4] & ~1) | ((0x1b > 6) ? 1 : 0);
    func_020373cc(0x24, 1);

    *(int *)((char *)data_ov006_0224f330 + 0xc) = 0;
    data_ov006_0224f330[0] = 2;
    return 1;
}
