/* CAMPAIGN-PREP candidate for func_020881b0 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     signed :1 bitfield guard + (1<<field) call + bic + tail call
 *   risk:       bitfield layout (bit1 signed) and field offsets guessed; sub-call arg order may flip
 *   confidence: med
 */
/* func_020881b0: if signed bit-1 field set, run the disable path
 * (func_02095030 with 1<<field40, two sub-callbacks at +8/+0x14,
 * clear bit 1 of field_24, 3-call release), then always tail-call
 * func_02088180(p).
 */

typedef struct St81b0 {
    char _pad_00[0x08];
    char _grp08[0x14 - 0x08];/* +0x08 sub-struct A */
    char _grp14[0x24 - 0x14];/* +0x14 sub-struct B */
    signed int _b0 : 1;
    signed int flag1 : 1;    /* bit 1 of field_24 */
    signed int _rest : 30;
    char _pad_28[0x40 - 0x28];
    int field_40;            /* +0x40 */
    int field_44;            /* +0x44 */
} St81b0;

extern void func_02088180(St81b0 *p);
extern void func_02095030(int a, int b, int c, int d);
extern int  func_020955a8(void);
extern void func_020955e8(int a);
extern void func_02095678(int a);
extern void func_0209a7f4(void *p);
extern void func_0209a80c(void *p);

void func_020881b0(St81b0 *p) {
    int x;

    if (p->flag1) {
        func_02095030(p->field_44, 0, 1 << p->field_40, 0);
        func_0209a80c(&p->_grp08);
        func_0209a7f4(&p->_grp14);
        p->flag1 = 0;
        x = func_020955a8();
        func_02095678(1);
        func_020955e8(x);
    }
    func_02088180(p);
}
