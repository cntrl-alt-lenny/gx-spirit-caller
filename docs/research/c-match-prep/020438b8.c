/* CAMPAIGN-PREP candidate for func_020438b8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     /3 and %3 -> plain /,% (magic 0xaaaaaaab); per-group field stores in asm order; pad 0x2a
 *   risk:       permuter-class: 436-byte fn already ships .s for reg-alloc reasons. The exact umull-pair sequence (two-stage reciprocal w/ extra /3 of count) + r4..fp allocation across the loop will not match a first build; the cnt/chunk derivation is reverse-engineered (struct/semantics-guessed) and almost certainly needs escape-to-.s.
 *   confidence: low
 */
/* func_020438b8 — base64 DECODER: n=r1 input len, out=r2, validate, then
 * decode in groups of 3 input chars -> up to 4 output bytes using a sign-table
 * data_020fec48. Uses /3 and %3 (magic 0xaaaaaaab) for length math.
 * Class D: divide-by-constant (umull/smull magic) + group store-order. */
extern signed char *data_020fec48;          /* ptr to 64-entry signed decode table */
extern void func_020945f4(void *dst, int z, int k);
extern void func_02094688(const char *src, void *tmp, int k);

int func_020438b8(const char *in, unsigned n, char *out, int outcap) {
    char *o = out;
    /* output length check: groups = (n + r) ... derived from /3,*4 magic.
     * model the validated length as (n/3)*4 + (n%3 ? 4:0) compared to outcap. */
    unsigned full = n / 3;
    unsigned rem  = n % 3;
    unsigned need = (full << 2) + (rem ? 4 : 0);
    if (outcap == 0) return need;
    if (outcap < (int)need) return -1;
    {
        const char *end = in + n;
        signed char *tbl = data_020fec48;
        if (in != end) {
            char tmp[4];
            do {
                unsigned left = (unsigned)(end - in);
                /* take chunk = min(left,3); cnt = how many output bytes */
                unsigned chunk = left;
                unsigned cnt = ((left * 8) / 6);   /* bits available -> bytes */
                if (left >= 3) chunk = 3;
                func_020945f4(tmp, 0, 3);
                func_02094688(in, tmp, chunk);
                tbl = data_020fec48;
                o[0] = tbl[(unsigned char)tmp[0] >> 2];
                if (cnt < 2) { o[1] = 0x2a; goto done3; }
                o[1] = tbl[(((unsigned char)tmp[0] << 4) & 0x3f) | ((unsigned char)tmp[1] >> 4)];
            done3:
                if (cnt < 3) { o[2] = 0x2a; goto done2; }
                o[2] = tbl[(((unsigned char)tmp[1] << 2) & 0x3f) | ((unsigned char)tmp[2] >> 6)];
            done2:
                if (cnt < 4) { o[3] = 0x2a; }
                else o[3] = tbl[(unsigned char)tmp[2] & 0x3f];
                in += chunk;
                o += 4;
            } while (in != end);
        }
    }
    return (int)(o - out);
}
