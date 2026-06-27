/* CAMPAIGN-PREP candidate for func_021b29b0 (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two bools materialized then equality-tested -> teq; p bound across uses; :3 chan bitfield
 *   risk:       hinges on mwcc emitting the `teq` of the two 0/1 bools (proven ov006 recipe); the 02104f4c `:3` chan field is struct-guessed but confirmed in ov005_core. reshape-able.
 *   confidence: med
 */
/* func_ov006_021b29b0: prep step. Run 02001ba4(), Fill32 the 0x1c block at
 * 021cf158, fetch p=021b6be0(0224f448,2,0). If (*p==0) equals (104f4c.chan==0),
 * call 020a978c(021cf158, p+1). Then 021ad018(021cf158,1), 021ad030(021cf1b0,
 * 0x80000), set 021cf140=10, return 1. */
extern char data_ov006_021cf158[];
extern char data_ov006_021cf1b0[];
extern int  data_ov006_021cf140;
extern char data_ov006_0224f448[];
extern struct { int w0; unsigned chan : 3; } data_02104f4c;
extern void func_02001ba4(void);
extern void Fill32(int, void *, int);
extern unsigned char *func_ov006_021b6be0(void *, int, int);
extern void func_020a978c(void *, void *);
extern void func_ov005_021ad018(void *, int);
extern void func_ov005_021ad030(void *, int);

int func_ov006_021b29b0(void) {
    unsigned char *p;
    func_02001ba4();
    Fill32(0, data_ov006_021cf158, 0x1c);
    p = func_ov006_021b6be0(data_ov006_0224f448, 2, 0);
    if ((*p == 0) == (data_02104f4c.chan == 0)) {
        func_020a978c(data_ov006_021cf158, p + 1);
    }
    func_ov005_021ad018(data_ov006_021cf158, 1);
    func_ov005_021ad030(data_ov006_021cf1b0, 0x80000);
    data_ov006_021cf140 = 10;
    return 1;
}
