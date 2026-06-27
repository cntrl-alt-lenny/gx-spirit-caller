/* CAMPAIGN-PREP candidate for func_02213974 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: h4.bit2 :2/:1 bitfield guard; smulbb=hi*0x14 (hi 0..255 so plain mul); sel=(lo&1)*0x868
 *   risk:       struct-guessed + TRUNCATED: 0x7e/default bodies and the 13-bit 'val' use are absent from asm, so those bytes cannot match; also hi via smulbb may need explicit (short) cast to force smulbb not mul.
 *   confidence: low
 */
/* func_ov002_02213974 (ov002, cls D): guard on h4.bit2, fetch a packed pair
 * via 0223de94 (lo=byte0, hi=byte1), smulbb byte1*0x14 indexes the cf16c
 * record table (+sel*0x868 +0x30), then dispatch on phase 0x7e/0x7f/0x80.
 * WARNING: source asm is TRUNCATED at 'bl 021e2b1c'; the 0x7e (.L_43c) and
 * default (.L_490) bodies, the 0x7f tail, and the use of the 13-bit field
 * 'val' are reconstructed by intent only. */

extern unsigned char data_ov002_022ce288[];   /* [0x5a8]=phase */
extern unsigned char data_ov002_022cf16c[];   /* sel + idx*0x14 + 0x30 record word */
extern unsigned char data_ov002_022cf1a2[];   /* sel + idx*0x14 halfword */
extern unsigned char data_ov002_022cf1a4[];   /* sel + idx*0x14 halfword */
extern int  func_ov002_021c84a8(void);
extern int  func_ov002_021d63fc(void *self, int lo, int hi, int d);
extern int  func_ov002_021de4d8(void);
extern int  func_ov002_021df708(int lo);
extern int  func_ov002_021e2b1c(int a);
extern int  func_ov002_021e2b3c(void);
extern int  func_ov002_021e2c5c(void);
extern int  func_ov002_021e2d94(int lo, int hi, int c, int d);
extern int  func_ov002_0223de94(void *self, int sel);
extern int  func_ov002_0223df38(void *self, int b, int c);
extern int  func_ov002_02253ea4(void);

typedef struct Obj {
    unsigned short h0;          /* 0x00 */
    unsigned short h2;          /* 0x02 */
    unsigned short h4b0 : 2;    /* 0x04 bits0..1 */
    unsigned short h4b2 : 1;    /* 0x04 bit2 (guard) */
    unsigned short h4hi : 13;
} Obj;

int func_ov002_02213974(void *obj) {
    Obj *o = (Obj *)obj;
    int packed, lo, hi, sel, idx, phase, val;

    if (o->h4b2)
        return 0;

    packed = func_ov002_0223de94(obj, 0);
    lo  = packed & 0xff;
    hi  = ((unsigned short)packed >> 8) & 0xff;
    sel = (lo & 1) * 0x868;
    idx = hi * 0x14;
    phase = *(int *)(data_ov002_022ce288 + 0x5a8);
    val = *(int *)(data_ov002_022cf16c + sel + idx + 0x30) & 0x1fff;

    if (phase == 0x80) {
        if (func_ov002_0223df38(obj, 0, 0) == 0)
            return 0;
        if (*(unsigned short *)(data_ov002_022cf1a2 + sel + idx) == 0)
            return 0;
        if (*(unsigned short *)(data_ov002_022cf1a4 + sel + idx) != 0)
            return 0;
        func_ov002_021e2b3c();
        func_ov002_021d63fc(obj, lo, hi, 1);
        func_ov002_021e2d94(lo, hi, 2, 1);
        return 0x7f;
    }
    if (phase == 0x7f) {
        func_ov002_021df708(lo);
        func_ov002_021e2b1c(0x1e);
        return val;        /* TRUNCATED: tail reconstructed by intent */
    }
    /* phase == 0x7e (.L_43c) and default (.L_490): TRUNCATED, unknown */
    return val;
}
