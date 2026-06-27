/* CAMPAIGN-PREP candidate for func_0206a7b0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D/C: count loop, if/else-if type dispatch (0/1/2/default), signed len<0 guard
 *   risk:       reshape-able: dispatch is cmp 0/1/2 chain — if/else-if usually matches, but mwcc may build a jump table or reorder the case0/case1/case2 block layout; ctx->f8 (ctx[2]) and record->f4 offsets are inferred.
 *   confidence: med
 */
/* func_0206a7b0 — iterate count records, dispatch on record type to advance a
 * (ptr,len) cursor; type0 also consumes an escape byte 0xff via func_0206b44c.
 *   n = func_02054140(ctx->f8);
 *   for (i = 0; i < n; i++) {
 *       t = func_020540d0(ctx->f8, i)->f4;
 *       switch (t) {
 *         case 0: if (len < 1) return 0; c = *p++; len--;
 *                 if (c == 0xff) { r = func_0206b44c(p, len);
 *                                  if (r == -1) return 0; p += r; len -= r; }
 *                 break;
 *         case 1: p += 1; len -= 1; break;
 *         case 2: p += 2; len -= 2; break;
 *         default: func_020a6d54(data_02101dd4, data_02101db0, 0, 0x317); return 0;
 *       }
 *       if (len < 0) return 0;
 *   }
 *   return 1;
 */
typedef unsigned char u8;

extern int data_02101db0;
extern int data_02101dd4;
extern int func_02054140(void *p);
extern void *func_020540d0(void *p, int i);
extern int func_0206b44c(u8 *p, int len);
extern void func_020a6d54(void *a, void *b, int c, int d);

int func_0206a7b0(int *ctx, u8 *p, int len)
{
    int i, n;
    n = func_02054140((void *)ctx[2]);
    for (i = 0; i < n; i++) {
        int t = *(int *)((char *)func_020540d0((void *)ctx[2], i) + 4);
        if (t == 0) {
            int c;
            if (len < 1)
                return 0;
            c = *p++;
            len--;
            if (c == 0xff) {
                int r = func_0206b44c(p, len);
                if (r == -1)
                    return 0;
                p += r;
                len -= r;
            }
        } else if (t == 1) {
            p += 1;
            len -= 1;
        } else if (t == 2) {
            p += 2;
            len -= 2;
        } else {
            func_020a6d54(&data_02101dd4, &data_02101db0, 0, 0x317);
            return 0;
        }
        if (len < 0)
            return 0;
    }
    return 1;
}
