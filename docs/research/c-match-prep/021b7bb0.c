/* CAMPAIGN-PREP candidate for func_021b7bb0 (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     uninit-on-case0 base-select; hold u16 across call; flag picks fn-ptr arg
 *   risk:       orig switch is cmp#4;addls-pc over sel 0..4 but cases here are 1..5 (asm dispatches 0..4 to bodies labelled .L_40..); off-by-one case labels could shift jump-table — confirm case values (struct-guessed/reshape-able).
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov006_021b7bb0 (ov006, class C) — MED tier.
 * UNVERIFIED build-free draft.
 *   recipe: switch base-select into single ptr (uninit on case0/default); halfword load held across call; flag-branch picks func ptr arg.
 * Sig: r0=p, r1=sel. r5=sel decl-first then r6=p per asm (mov r6 then mov r5 — p alloc'd r6, sel r5). func_020a97b8(dst,val,n,fn). */

extern void func_020a97b8(void *dst, int val, int n, void *fn);
extern void func_ov006_021b81dc(void *p);
extern int  func_ov006_021b831c(void *p, int sel, int flag);
extern void func_ov006_021b8544(void *p, int sel);
extern int  func_ov006_021b8fa8(void *p, int sel);
extern void func_ov006_021b9010(void);
extern void func_ov006_021b940c(void);

int func_ov006_021b7bb0(char *p, int sel) {
    char *q;
    unsigned short v;
    func_ov006_021b81dc(p);
    func_ov006_021b831c(p, sel, 1);
    switch (sel) {
    case 1:  q = p + 0x198 + 0x9800; break;
    case 2:  q = p + 0x358 + 0xb000; break;
    case 3:  q = p + 0x158 + 0xb800; break;
    case 4:  q = p + 0x358 + 0xbc00; break;
    case 5:  q = p + 0x58  + 0xc400; break;
    }
    v = *(unsigned short *)(p + sel * 2 + 0xc600 + 0x62);
    func_ov006_021b8fa8(p, sel);
    if (*(int *)(p + 0x6000 + 0x29c) != 0)
        func_020a97b8(q, v, 4, (void *)func_ov006_021b940c);
    else
        func_020a97b8(q, v, 4, (void *)func_ov006_021b9010);
    func_ov006_021b8544(p, sel);
    return 1;
}
