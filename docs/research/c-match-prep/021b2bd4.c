/* CAMPAIGN-PREP candidate for func_021b2bd4 (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: :3 field; pass cf140.f14 to 021b6be0 r2; reload f14; state=5 last
 *   risk:       struct-guessed + reshape-able: arg order for 021b6be0 (r1=0,r2=f14) and 020091f4 (r1=f14,r2=0,r3=h) inferred from reg setup; f14 is reloaded (ldr twice) so keep two reads. Bind h to r4 across 4 uses (as written). Confirm cf140 layout.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov006_021b2bd4 (ov006, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Richer sibling of 021b2a58.
 *   recipe: CLASS D: 3-bit field :3; pass g_cf140.f14 as 021b6be0 r2; extra func_020091f4(h, *, h[0]); reload field; state=5 last.
 */
/* func_ov006_021b2bd4: gate -> alloc handle (021b6be0 with g_cf140.f14 as 3rd
 * arg), memset+register, store 3-bit field into h[0], then func_020091f4 with
 * g_cf140.f14 reloaded and h. Common tail identical to 021b2a58. */

extern int  func_ov005_021ad048(void);
extern void func_020aaddc(void *p);
extern int  func_ov006_021b6be0(void *p, int a, int b);
extern void func_020945f4(void *dst, int val, int len);
extern void func_020a978c(void *p, void *q);
extern void func_020091f4(int a, int b, void *c);
extern void func_020018d4(int a);
extern void func_0200197c(int a, void *b, int c);
extern void func_02001d68(int a);

typedef struct { unsigned int f4 : 3; unsigned int : 29; } G104f4c;
extern G104f4c data_02104f4c;                 /* _LIT3 */
extern void *data_ov006_021cf158;             /* _LIT0 */
extern void *data_ov006_0224f448;             /* _LIT2 */
extern void *data_ov006_021cf1b0;             /* _LIT4 */
typedef struct { int f0; int pad[4]; int f14; } GCf140;
extern GCf140 data_ov006_021cf140;            /* _LIT1 state word + f14 */

int func_ov006_021b2bd4(void)
{
    if (func_ov005_021ad048() != 0) {
        char *h;
        func_020aaddc(&data_ov006_021cf158);
        h = (char *)func_ov006_021b6be0(&data_ov006_0224f448, 0,
                                        data_ov006_021cf140.f14);
        func_020945f4(h + 1, 0, 0x19);
        func_020a978c(h + 1, &data_ov006_021cf158);
        h[0] = (char)(data_02104f4c.f4);
        func_020091f4(data_ov006_021cf140.f14, 0, h);
    }
    func_020018d4(0xa0);
    func_0200197c(4, &data_ov006_021cf1b0, 0x80000);
    func_02001d68(data_02104f4c.f4);
    data_ov006_021cf140.f0 = 5;
    return 1;
}
