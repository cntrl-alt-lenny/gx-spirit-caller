/* CAMPAIGN-PREP candidate for func_021d07b0 (ov011, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reproduce visible flow; cross-overlay BL cannot be a C call
 *   risk:       the module:none bl to 0x021b1ab4 (.word 0xebff849b) has no resolvable symbol under ov0/ov2 overlap; mwcc cannot emit it -> ships as .s. permuter-class (escape-to-.s)
 *   confidence: low
 */
/* func_ov011_021d07b0: large linear init/dispatch driver. NOTE: ships as a
 * hand-encoded .s (brief 192/197 "C-32 cross-overlay BL wall"): it contains a
 * module:none BL to 0x021b1ab4 (encoded .word 0xebff849b) that has NO resolved
 * symbol under the ov0/ov2 base-overlap, so mwcc cannot emit it as a direct bl.
 * C below reproduces the *visible* logic for permuter/objdiff seeding only;
 * a clean byte-match is NOT expected without escaping the cross-overlay call.
 *
 * Flow: g = &data_021d4000; g[0x140] |= 0x40; 021d1d30();
 *       if (data_021d403c[0x2a0] == 1) 021cbc1c();
 *       <chain of subsystem calls 021cf0c8/021d12c0/021d1884/021cf228/021ce50c>;
 *       sel = (data_021d4000[0x274] << 0x13) >>s 0x1c  (signed nibble field);
 *       switch(sel-ish): pick one of 021cffe4 / 021d02a4 (capturing r5), then
 *       021cf640(); 021ccb6c(); 021ca538(data_021d4000[0x288]);
 *       <cross-overlay bl 0x021b1ab4>; 021cc8bc(); 021cc814();
 *       021cf228-style fixed-arg pokes: 02005e20(1),02005e20(2),02005ca0(1),
 *       02005ca0(2); 021ab8f8(); return r5. */
extern char data_ov011_021d4000[];
extern char data_ov011_021d403c[];
extern char data_ov006_021cbf28[];   /* called as code (overlap) */
extern char data_ov012_021cc344[];   /* called as code (overlap) */
extern void func_02005ca0(int);
extern void func_02005e20(int);
extern void func_ov000_021ab8f8(void);
extern int  func_ov011_021ca538(int);
extern void func_ov011_021cbc1c(void);
extern void func_ov011_021cc814(void);
extern void func_ov011_021cc8bc(void);
extern void func_ov011_021ccb6c(void);
extern void func_ov011_021ce50c(void);
extern void func_ov011_021cf0c8(void);
extern void func_ov011_021cf228(void);
extern void func_ov011_021cf640(void);
extern int  func_ov011_021cffe4(void);
extern int  func_ov011_021d02a4(void);
extern void func_ov011_021d12c0(void);
extern void func_ov011_021d1884(void);
extern void func_ov011_021d1d30(void);

int func_ov011_021d07b0(void) {
    int sel;
    int r5 = 0;

    *(unsigned int *)(data_ov011_021d4000 + 0x140) |= 0x40;
    func_ov011_021d1d30();
    if (*(int *)(data_ov011_021d403c + 0x2a0) == 1)
        func_ov011_021cbc1c();
    func_ov011_021cf0c8();
    func_ov011_021d12c0();
    func_ov011_021d1884();
    func_ov011_021cf228();
    func_ov011_021ce50c();

    sel = (*(int *)(data_ov011_021d4000 + 0x274) << 0x13) >> 0x1c;
    if (sel == 1)
        r5 = func_ov011_021cffe4();
    else if (sel == 0)
        r5 = func_ov011_021d02a4();

    func_ov011_021cf640();
    func_ov011_021ccb6c();
    func_ov011_021ca538(*(int *)(data_ov011_021d4000 + 0x288));
    /* cross-overlay bl 0x021b1ab4 — unresolved under base-overlap; .s only */
    func_ov011_021cc8bc();
    func_ov011_021cc814();
    func_02005e20(1);
    func_02005e20(2);
    func_02005ca0(1);
    func_02005ca0(2);
    func_ov000_021ab8f8();
    return r5;
}
