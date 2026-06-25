/* CAMPAIGN-PREP candidate for func_02088cc0 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     global-struct guard chain + && call-guard + asr#8 + change-detect call
 *   risk:       data_021a524c struct offsets guessed; r4=result>>8 signed; [+0x24] arg type int vs ptr
 *   confidence: med
 */
/* func_02088cc0: operate on global struct data_021a524c.
 *   if (!f0) return; if (f4 != 0) return;
 *   func_0208b058(&f3c);
 *   if (f4c && func_0208b040(&f3c)) { func_02088874(); return; }
 *   v = func_0208b070(&f3c) >> 8;            (signed asr)
 *   if (v == f50) return;
 *   func_02094f14(f24, v, 0); f50 = v;
 */

typedef struct G88cc0 {
    int  field_0;            /* +0x00 */
    int  field_4;            /* +0x04 */
    char _pad_08[0x24 - 0x08];
    int  field_24;           /* +0x24 handle */
    char _pad_28[0x3c - 0x28];
    char grp_3c[0x4c - 0x3c];/* +0x3c sub-struct (by address) */
    int  field_4c;           /* +0x4c */
    int  field_50;           /* +0x50 last value */
} G88cc0;

extern G88cc0 data_021a524c;
extern void func_02088874(void);
extern int  func_0208b040(void *p);
extern void func_0208b058(void *p);
extern int  func_0208b070(void *p);
extern void func_02094f14(int a, int b, int c);

void func_02088cc0(void) {
    int v;

    if (data_021a524c.field_0 == 0) return;
    if (data_021a524c.field_4 != 0) return;

    func_0208b058(&data_021a524c.grp_3c);

    if (data_021a524c.field_4c != 0 && func_0208b040(&data_021a524c.grp_3c) != 0) {
        func_02088874();
        return;
    }

    v = func_0208b070(&data_021a524c.grp_3c) >> 8;
    if (v == data_021a524c.field_50) return;

    func_02094f14(data_021a524c.field_24, v, 0);
    data_021a524c.field_50 = v;
}
