/* CAMPAIGN-PREP candidate for func_021b9c98 (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     unsigned <0x100 early-return ldrsb; (hi)|(lo<<8) byteswap; store key(strh) before fnptr(str); pass &key
 *   risk:       struct-guessed: the {cmp,key} stack block + passing &s.key as r0 (with fnptr at key[-1]) is an inferred layout; mwcc's frame/strh-before-str order and the 8-byte sub sp are the likely first diverge.
 *   confidence: low
 */
/* func_ov006_021b9c98: if (v<0x100) return (s8)tbl[v]; else byteswap v into a u16 key
 * on the stack (with a comparator fnptr stored just before it), binary-search it,
 * and map the hit through a second table (-1). Returns -1 on miss.
 *
 *   cmp r1,#0x100 (unsigned cc) -> ldrsb tbl[v] early-return
 *   strh bswap16(v) @ sp+4 ; str &cmp @ sp+0   (halfword stored FIRST)
 *   func_020059b0(&sp4, *(cbbc8+4), 0xb1, 2)
 *   if (r>=0xb1) return -1; else (s8)*(*(cbbc8+0xc)+r) - 1
 */

extern signed char data_ov006_021cb4f8[];
extern char data_ov006_021cbbc8[];
extern int func_ov006_021b9d1c(void *a, void *b);
extern int func_020059b0(void *key, void *base, int n, int sz);

int func_ov006_021b9c98(int unused, int v) {
    struct { void *cmp; short key; } s;
    int r;
    if ((unsigned)v < 0x100) return data_ov006_021cb4f8[v];
    s.key = (short)(((v >> 8) & 0xff) | ((v & 0xff) << 8));
    s.cmp = (void *)func_ov006_021b9d1c;
    r = func_020059b0(&s.key, *(void **)(data_ov006_021cbbc8 + 4), 0xb1, 2);
    if (r >= 0xb1) return -1;
    return *(signed char *)(*(char **)(data_ov006_021cbbc8 + 0xc) + r) - 1;
}
