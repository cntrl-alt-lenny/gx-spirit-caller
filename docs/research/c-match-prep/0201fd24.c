/* CAMPAIGN-PREP candidate for func_0201fd24 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: bool->u16 widen via u16 local (lsl;lsr); 5th arg on stack
 *   risk:       reshape-able: u16 local should force lsl#16;lsr#16; if mwcc emits `and #0xffff` instead, switch flag to a `:16` bitfield struct member. struct-guessed offsets too.
 *   confidence: med
 */
/* func_0201fd24 (class D): bool->u16 bitfield widen (lsl16;lsr16) + 5th stack arg.
 *   ldr [0x30]; cmp 4 / 6 / 5 ; bne .L_3c
 *     ldr [0x38] fn; if(fn) blx(&data_020c66c8); return 1
 *   .L_3c: func_0201f138(3)
 *     r=( [0x18]!=0 );  u16 widen (lsl#16;lsr#16); str [sp] (arg5)
 *     func_0209ea24(&func_0201fdc4, &data_02192020, 0, 1, u16);
 *     if(==2) return 1; func_0201f19c(); return 0
 */
typedef void (*fn38_t)(void *);
typedef struct {
    char            _pad00[0x18];
    int             f18;        /* +0x18 */
    char            _pad1c[0x30 - 0x1c];
    int             f30;        /* +0x30 */
    char            _pad34[0x38 - 0x34];
    fn38_t          f38;        /* +0x38 */
} S2191f40;

extern S2191f40 data_02191f40;
extern void   data_020c66c8;
extern void   data_02192020;
extern void   func_0201fdc4(void);
extern void   func_0201f138(int);
extern void   func_0201f19c(void);
extern int    func_0209ea24(void (*cb)(void), void *ctx, int a, int b, unsigned short flag);

int func_0201fd24(void) {
    if (data_02191f40.f30 == 4 || data_02191f40.f30 == 6 || data_02191f40.f30 == 5) {
        if (data_02191f40.f38 != 0)
            data_02191f40.f38(&data_020c66c8);
        return 1;
    }
    func_0201f138(3);
    {
        unsigned short flag = (data_02191f40.f18 != 0);
        if (func_0209ea24(func_0201fdc4, &data_02192020, 0, 1, flag) == 2)
            return 1;
    }
    func_0201f19c();
    return 0;
}
