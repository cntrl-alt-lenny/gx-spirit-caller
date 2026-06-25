/* CAMPAIGN-PREP candidate for func_0206de68 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     early-exit guards as mvn err codes; s&&flag short-circuit; bind p in r4
 *   risk:       `cmp r4,#0;mvnle` is a SIGNED <=0 guard on a pointer param; if mwcc treats p as unsigned the mvnle/bxle inverts (reshape-able: declare param signed int, cast). Field offsets struct-guessed.
 *   confidence: med
 */
/* func_0206de68 (main, class C): validate a sub-object, set busy flags,
 * optionally cancel, then register a teardown callback and clear a field.
 * param is the sub-object directly (m70 short flags, m73 s8, m68/m8). */

typedef struct {
    char        _pad_00[0x8];
    int         m8;          /* +0x8 (set 0 on the bf94 result) */
    char        _pad_0c[0x68 - 0xc];
    void       *m68;         /* +0x68 */
    char        _pad_6c[0x70 - 0x6c];
    short       m70;         /* +0x70  ldrsh/strh flags */
    char        _pad_72[1];
    signed char m73;         /* +0x73 */
} obj_t;

extern int    func_0206e474(obj_t *p);
extern int    func_0206e4a4(obj_t *p);
extern void   func_0206bef4(void *p, int a);
extern obj_t *func_0206bf94(void *cb, obj_t *p, int one);
extern void   func_0206bed8(obj_t *p);
extern int    func_0206ddc0(obj_t *p);   /* callback, taken by address */

int func_0206de68(obj_t *p) {
    obj_t *r;

    if (p <= 0) return ~0x1b;
    if (func_0206e474(p) != 0) return ~0x19;
    if (func_0206e4a4(p) != 0) return 0;

    if (!(p != 0 && (p->m70 & 1))) return ~0x26;
    if (p->m70 & 0x10) return ~0x19;

    p->m70 |= 0x18;
    if (p->m73 == 0 || p->m73 == 4)
        func_0206bef4(p->m68, 0);

    r = func_0206bf94(func_0206ddc0, p, 1);
    r->m8 = 0;
    func_0206bed8(p);
    return 0;
}
