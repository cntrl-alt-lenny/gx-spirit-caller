/* CAMPAIGN-PREP candidate for func_021b28c0 (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: switch 0..3 jump-table; hi=v>>16 lo=v&0xffff; store f10,f14,f0 in order
 *   risk:       reshape-able: case2 stores f14 BEFORE f0 and case3 stores f10,f14,f0 in that exact order - if mwcc reorders, swap statement order. The addls-pc table needs default to also cover sel==0 (cmp #3 range); confirm.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov006_021b28c0 (ov006, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe: CLASS D: switch(state 0..3) -> addls pc jump-table; halfword unpack hi=v>>16 lo=v&0xffff; store-order [0x10] then [0x14] then [0].
 */
/* func_ov006_021b28c0: read p->f50 (sel) and p->f54 (payload), run 3 sub-
 * updates, then dispatch on sel writing a command code (and operands) into
 * g_cmd. case3 unpacks payload into two halfwords. */

extern int func_ov006_021c9ef4(void *a, void *b);
extern int func_ov006_021c19e4(void *a);
extern int func_ov006_021b2620(void);

typedef struct { int f0; int f10; int f14; } GCmd;     /* _LIT2 */
extern GCmd data_ov006_021cf140;

typedef struct { char pad[0x50]; int f50; int f54; } GSrc;  /* _LIT0 */
extern GSrc data_ov006_0225cbb8;
extern void *data_ov006_0225e068;                     /* _LIT1 */

int func_ov006_021b28c0(void)
{
    int sel = data_ov006_0225cbb8.f50;
    int payload = data_ov006_0225cbb8.f54;

    func_ov006_021c9ef4(&data_ov006_0225e068, &data_ov006_0225cbb8);
    func_ov006_021c19e4(&data_ov006_0225cbb8);
    func_ov006_021b2620();

    switch (sel) {
    case 1:
        data_ov006_021cf140.f0 = 8;
        break;
    case 2:
        data_ov006_021cf140.f14 = payload;
        data_ov006_021cf140.f0  = 0xb;
        break;
    case 3:
        data_ov006_021cf140.f10 = (unsigned int)payload >> 16;
        data_ov006_021cf140.f14 = payload & 0xffff;
        data_ov006_021cf140.f0  = 0xe;
        break;
    default:
        data_ov006_021cf140.f0 = 2;
        break;
    }
    return 1;
}
