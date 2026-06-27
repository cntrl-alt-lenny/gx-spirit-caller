/* CAMPAIGN-PREP candidate for func_021b2b28 (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: synth two booleans; low-3-bits test; if-assign moveq/movne pair
 *   risk:       VERIFIED off-by-2: mwcc emits `tst r0,#7` + `cmp r2,r0`; orig wants `lsl#29;lsr#29` (struct-guessed: real :3 bitfield at data_02104f4c+4) and `teq` (permuter-class idiom). Rest byte-identical.
 *   confidence: med
 */
/* func_ov006_021b2b28 (ov006, class C/D): state-enter handler.
 * teq of two synthesized booleans guards a call; ends by writing state=0xd.
 * Sibling 021b29b0 is the same body with different constants. */

extern void func_02001ba4(void);
extern void Fill32(int value, void *dst, int size);
extern char *func_ov006_021b6be0(void *base, int sel, int idx);
extern void func_020a978c(void *a, char *b);
extern void func_ov005_021ad018(void *a, int b);
extern void func_ov005_021ad030(void *a, int b);

extern char data_02104f4c[];
extern int  data_ov006_021cf140[];          /* [0]=state word, [0x14/4]=idx */
extern char data_ov006_021cf158[];
extern char data_ov006_021cf1b0[];
extern char data_ov006_0224f448[];

int func_ov006_021b2b28(void) {
    char *p;
    int a;
    int b;

    func_02001ba4();
    Fill32(0, data_ov006_021cf158, 0x1c);

    p = func_ov006_021b6be0(data_ov006_0224f448, 0, data_ov006_021cf140[0x14 / 4]);
    a = (*(unsigned char *)p == 0);
    b = ((*(int *)(data_02104f4c + 4) & 7) == 0);
    if (a == b) {
        func_020a978c(data_ov006_021cf158, p + 1);
    }

    func_ov005_021ad018(data_ov006_021cf158, 2);
    func_ov005_021ad030(data_ov006_021cf1b0, 0x80000);
    data_ov006_021cf140[0] = 0xd;
    return 1;
}
