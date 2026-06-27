/* CAMPAIGN-PREP candidate for func_021b1ad8 (ov008, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two-arm init; vram+0x4e0; &&-guard (a0 && *(s8)o->f50==0); stack-arg func_02005088; reload *270c
 *   risk:       ASM TRUNCATED at add sp,#8 (epilogue cut) AND _LIT0/_LIT2 cfg symbols unnamed in the .extern list -> placeholder names will fail the link until reconciled. struct-guessed
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov008_021b1ad8 (ov008, class C, MED) — built-free.
 * UNVERIFIED + ITERATION-EXPECTED. 316B two-arm init, stack-arg marshalling.
 * NOTE: asm body is truncated at "add sp,#8" — the literal pool (the two cfg
 * data symbols feeding func_02094504 and func_02001e94, "_LIT0"/"_LIT2") is NOT
 * shown; their real symbol names must be filled from the full delink. Placeholder
 * names data_ov008_021b1ad8_lit0/_lit2 below MUST be reconciled.
 *
 * vram = func_0208de94() + 0x4e0; func_02094504(0, vram+0x2000, LIT0). o = *021b270c.
 * If (a0 != 0 && (sub = o->f50, *(s8)sub == 0)): arm A — o->f34=4,
 * func_02001d0c(o+0x28, 0x13, 0x13), func_02005088(o+0x28, sub, vram+0x2000, 6, 4, 0xc),
 * o->f68 = 1.  Else: arm B — func_02001d0c(o+0x28,0x13,0x13); o->f34=4;
 * o->f48 |= 0x800000; o->f50 = func_0202c46c(o->f10); o->f68=1; o->f5c=a0.
 * Tail (both): h = func_0208e120(); func_02001e94(o+0x28, h+0xd8, LIT2, 1).
 */
extern int  func_0208de94(void);
extern void func_02094504(int a0, void *p, void *cfg);
extern void func_02001d0c(void *p, int a, int b);
extern void func_02005088(void *p, void *sub, void *vram, int a, int b, int c);
extern int  func_0202c46c(int a0);
extern int  func_0208e120(void);
extern void func_02001e94(void *p, void *q, void *cfg, int a);

extern char data_ov008_021b270c[];          /* _LIT1: *-> scene obj */
extern char data_ov008_021b1ad8_lit0[];     /* _LIT0: func_02094504 cfg (name TBD) */
extern char data_ov008_021b1ad8_lit2[];     /* _LIT2: func_02001e94 cfg (name TBD) */

void func_ov008_021b1ad8(int a0) {
    char *vram = (char *)(func_0208de94() + 0x4e0);
    int *o;

    func_02094504(0, vram + 0x2000, data_ov008_021b1ad8_lit0);

    o = *(int **)data_ov008_021b270c;
    if (a0 != 0 && *(signed char *)((char *)o[0x50 / 4]) == 0) {
        char *sub = (char *)o[0x50 / 4];
        o[0x34 / 4] = 4;
        func_02001d0c((char *)o + 0x28, 0x13, 0x13);
        func_02005088((char *)(*(int **)data_ov008_021b270c) + 0x28,
                      sub, vram + 0x2000, 6, 4, 0xc);
        (*(int **)data_ov008_021b270c)[0x68 / 4] = 1;
    } else {
        func_02001d0c((char *)o + 0x28, 0x13, 0x13);
        o = *(int **)data_ov008_021b270c;
        o[0x34 / 4] = 4;
        o[0x48 / 4] |= 0x800000;
        o[0x50 / 4] = func_0202c46c(o[0x10 / 4]);
        o[0x68 / 4] = 1;
        o[0x5c / 4] = a0;
    }

    {
        int h = func_0208e120();
        func_02001e94((char *)(*(int **)data_ov008_021b270c) + 0x28,
                      (char *)h + 0xd8, data_ov008_021b1ad8_lit2, 1);
    }
}
