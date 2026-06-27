/* CAMPAIGN-PREP candidate for func_021b2a58 (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: g_104f4c.f4 as :3; reload field for both strb/call uses; state=5 last
 *   risk:       struct-guessed + reshape-able: 021b6be0 return used as h+1 in 3 places & h[0] store -> orig holds it in r4 (bind to one local, as written). The :3 field is read twice (strb then 02001d68 arg) - keep two reads. Confirm cf158 (memset-handle) arg shape.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov006_021b2a58 (ov006, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe: CLASS D: 3-bit field g_104f4c.f4 as :3 (lsl#29;lsr#29); reload g_104f4c.f4 for both uses; store g_cf140=5 last.
 */
/* func_ov006_021b2a58: if gate (021ad048) passes, alloc a 0x19-len handle
 * (021b6be0->memset 021945f4->register 020a978c), store a 3-bit field into
 * handle[0]. Then common tail: enable engine (020018d4 0xa0), set mode
 * (0200197c 4,sub,0x80000), push the 3-bit field (02001d68), state=5. */

extern int  func_ov005_021ad048(void);
extern void func_020aaddc(void *p);
extern int  func_ov006_021b6be0(void *p, int a, int b);
extern void func_020945f4(void *dst, int val, int len);
extern void func_020a978c(void *p, void *q);
extern void func_020018d4(int a);
extern void func_0200197c(int a, void *b, int c);
extern void func_02001d68(int a);

typedef struct { unsigned int f4 : 3; unsigned int : 29; } G104f4c;
extern G104f4c data_02104f4c;                 /* _LIT2 */
extern void *data_ov006_021cf158;             /* _LIT0 */
extern void *data_ov006_0224f448;             /* _LIT1 */
extern void *data_ov006_021cf1b0;             /* _LIT3 */
extern int   data_ov006_021cf140;             /* _LIT4 state word */

int func_ov006_021b2a58(void)
{
    if (func_ov005_021ad048() != 0) {
        char *h;
        func_020aaddc(&data_ov006_021cf158);
        h = (char *)func_ov006_021b6be0(&data_ov006_0224f448, 2, 0);
        func_020945f4(h + 1, 0, 0x19);
        func_020a978c(h + 1, &data_ov006_021cf158);
        h[0] = (char)(data_02104f4c.f4);
    }
    func_020018d4(0xa0);
    func_0200197c(4, &data_ov006_021cf1b0, 0x80000);
    func_02001d68(data_02104f4c.f4);
    data_ov006_021cf140 = 5;
    return 1;
}
