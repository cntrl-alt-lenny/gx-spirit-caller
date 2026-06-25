/* CAMPAIGN-PREP candidate for func_021fb488 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit0 of f2 + asymmetric 6-bit@5 of f4; if/else-if state dispatch; cd744 branch; state2 decrement
 *   risk:       021d7c40 arity ambiguous (state0 passes bit0 only; state2 passes d70,d78) and state-2 tail (post-decrement store/return) is cut from the batch. struct-guessed (d016c d70/d78 offsets).
 *   confidence: low
 */
/* func_ov002_021fb488 (ov002, cls C): 3-state dispatch on ce288.f1460, no self
 * frame held beyond r4. State 0: 021b9aa8(bit0, 6-bit field@5 of f4); if >=0
 * call 021d7c40(bit0 of f2). State 1: 021ae400(bit0,0x3a); branch on
 * cd744[bit0] (==1 ? 02290500(2, .., d016c) : 022592ec(d016c)). State 2:
 * if 022593f4(): 021d7c40(d70, d78) and return 1; else DECREMENT f1460. */

typedef unsigned short u16;

struct Self21fb488 { u16 f0; u16 b0 : 1; u16 f4_b0 : 1; u16 : 16; };
struct Ce21fb488   { char _a[0x5b4]; int f1460; };
struct D016c21fb488{ char _a[0xd70]; int fd70; char _b[4]; int fd78; };

extern struct Ce21fb488   data_ov002_022ce288;
extern struct D016c21fb488 data_ov002_022d016c;
extern int  data_ov002_022cd744[];

extern int  func_ov002_021b9aa8(int a, int b);
extern void func_ov002_021d7c40(int a, int b);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_02290500(int a, int b, struct D016c21fb488 *c);
extern void func_ov002_022592ec(struct D016c21fb488 *a);
extern int  func_ov002_022593f4(void);

int func_ov002_021fb488(void *arg0) {
    /* f2 -> bit0; f4 -> 6-bit field at bit5 (lsl#17;lsr#23 asymmetric) */
    u16 f2 = *(u16 *)((char *)arg0 + 2);
    u16 f4 = *(u16 *)((char *)arg0 + 4);
    int f2_b0 = (f2 << 31) >> 31 & 1;
    int f4_fld = (unsigned)(f4 << 17) >> 23;
    if (data_ov002_022ce288.f1460 == 0) {
        if (func_ov002_021b9aa8(f2_b0, f4_fld) >= 0)
            func_ov002_021d7c40(f2_b0, 0); /* 1-arg in orig (r0 only) */
        data_ov002_022ce288.f1460++;
        return 0;
    }
    if (data_ov002_022ce288.f1460 == 1) {
        func_ov002_021ae400(f2_b0, 0x3a);
        if (data_ov002_022cd744[f2_b0] == 1)
            func_ov002_02290500(2, 0, &data_ov002_022d016c);
        else
            func_ov002_022592ec(&data_ov002_022d016c);
        data_ov002_022ce288.f1460++;
        return 0;
    }
    if (data_ov002_022ce288.f1460 == 2) {
        if (func_ov002_022593f4() != 0) {
            func_ov002_021d7c40(data_ov002_022d016c.fd70,
                                data_ov002_022d016c.fd78);
            return 1;
        }
        data_ov002_022ce288.f1460--;
        return 0; /* trailing store/return reconstructed (last lines cut) */
    }
    return 0;
}
