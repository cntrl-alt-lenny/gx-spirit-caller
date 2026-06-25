/* CAMPAIGN-PREP candidate for func_021c31d0 (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard chain f8/f0/f4; bind handle h across s16-table select; ldrsh via short[] index*2
 *   risk:       reshape-able: ldrsh reads data_021cde2c at byte-offset f58<<2 => signed short[] index (f58*2); h held in r0 across select. If mwcc emits ldrh or reloads h, fix array signedness / bind h. Offsets guessed.
 *   confidence: med
 */
/* func_ov006_021c31d0 — guard chain: for each live handle in self->f8/f0/f4,
 * kick its channel and post a config; the f4 arm additionally selects a value
 * from an s16 table indexed by self->f58 and self->f64, posting it via (3,v). */
extern int  func_02021660(int a, int b, int c);
extern int  func_020216b0(int a, int b, int c);
extern void func_02022234(int a, int b);
extern short data_ov006_021cde2c[];

typedef struct {
    int  f0;             /* 0x00 */
    int  f4;             /* 0x04 */
    int  f8;             /* 0x08 */
    char _pad0c[0x4c];
    int  f58;            /* 0x58 */
    char _pad5c[0x8];
    int  f64;            /* 0x64 */
} Ov006GuardS;

int func_ov006_021c31d0(Ov006GuardS *self) {
    int v;
    if (self->f8 != 0) {
        func_020216b0(func_02021660(self->f8, 4, 0), 0, 1);
        func_020216b0(func_02021660(self->f8, 4, 1), 0, 1);
    }
    if (self->f0 != 0)
        func_020216b0(func_02021660(self->f0, 4, 0), 0, 1);
    if (self->f4 != 0) {
        int h = func_02021660(self->f4, 4, 0);
        if (data_ov006_021cde2c[self->f58 * 2] == 2)
            v = self->f64 ? 1 : 0;
        else
            v = 2;
        func_020216b0(h, 0, 0x801);
        func_02022234(3, v);
    }
    return 1;
}
