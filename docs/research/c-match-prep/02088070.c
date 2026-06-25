/* CAMPAIGN-PREP candidate for func_02088070 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     signed :1 bitfield guard + (1<<field) call + 3-call tail
 *   risk:       signed bitfield at bit 1 (lsl#30;asr#31) may need :2 layout; call-arg reg order may flip
 *   confidence: med
 */
/* func_02088070: guard on a signed 1-bit field at bit offset 1
 * (lsl #30; asr #31), then dispatch func_02095030 with a
 * (1 << field40) mask, then the standard 3-call release tail.
 */

typedef struct St8070 {
    char _pad_00[0x24];
    signed int _b0 : 1;      /* bit 0 */
    signed int flag1 : 1;    /* bit 1 -> tested */
    signed int _rest : 30;
    char _pad_28[0x40 - 0x28];
    int field_40;            /* +0x40 shift amount */
    int field_44;            /* +0x44 handle */
} St8070;

extern void func_02095030(int a, int b, int c, int d);
extern int  func_020955a8(void);
extern void func_020955e8(int a);
extern void func_02095678(int a);

void func_02088070(St8070 *p) {
    int x;

    if (!p->flag1) return;

    func_02095030(p->field_44, 0, 1 << p->field_40, 0);
    x = func_020955a8();
    func_02095678(1);
    func_020955e8(x);
}
