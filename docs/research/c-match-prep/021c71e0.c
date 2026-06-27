/* CAMPAIGN-PREP candidate for func_021c71e0 (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: bind base+0x420 (recompute +0x1000/call); :3 bitfield; guard reload f_44
 *   risk:       reshape-able: f_44 must RELOAD after the store (else-branch re-reads it); if mwcc caches f_44 in a reg one ldr is dropped. Also guard-chain r1=f_44 ordering.
 *   confidence: med
 */
/* func_ov006_021c71e0 (ov006, class D): VRAM setup + bitfield read + guard
 * chain selecting a source pointer, then func_02005088 marshal; sets f_40/f_44.
 * recipe: bind r6=base+0x420 (recompute +0x1000 per call); :3 bitfield on
 * global+4; guard r1 carries f_44 in the all-true path; f_44 RELOADED in else. */

typedef struct {
    int  _0;            /* +0x00 */
    int  sub;           /* +0x04 sub-object, address taken */
    char _pad8[0x2c - 0x08];
    int  f_2c;          /* +0x2c */
    char _pad30[0x38 - 0x30];
    int  f_38;          /* +0x38 */
    char _pad3c[0x40 - 0x3c];
    int  f_40;          /* +0x40 */
    signed char *f_44;  /* +0x44 */
} ov006_71e0_obj;

extern struct { int _0; unsigned int b : 3; } data_02104f4c;
extern char *func_0208ddec(void);
extern void func_02094504(int a, void *b, int c);
extern void func_02001d0c(void *p, int a, int b);
extern void func_02001d68(unsigned int v);
extern void *func_0202c46c(int h);
extern void func_02005088(void *dst, void *src, void *eng, int n, int s0, int s1);

int func_ov006_021c71e0(ov006_71e0_obj *this_, int flag) {
    void *src;
    char *base = func_0208ddec() + 0x420;
    func_02094504(0, base + 0x1000, 0x2d20);
    if (this_->f_38 == 0) {
        return 1;
    }
    func_02001d0c(&this_->sub, 0x13, 0x13);
    func_02001d68(data_02104f4c.b);
    if (flag && this_->f_44 && *this_->f_44) {
        src = this_->f_44;
    } else {
        src = func_0202c46c(this_->f_38);
    }
    func_02005088(&this_->sub, src, base + 0x1000, 6, 4, 0xc);
    this_->f_44 = (signed char *)this_->f_2c;
    if (flag) {
        this_->f_40 = 1;
    } else {
        int v = 0;
        if (this_->f_44 && *this_->f_44) {
            v = 1;
        }
        this_->f_40 = v;
    }
    return 1;
}
