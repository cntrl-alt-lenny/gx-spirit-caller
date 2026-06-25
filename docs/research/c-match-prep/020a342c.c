/* CAMPAIGN-PREP candidate for func_020a342c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     flag?const:const ternary (two cmp); cmp size,delta to match beq-to-read; shared close call both tails
 *   risk:       reshape-able: ternary should give movne/moveq; risk is mwcc emitting one cmp r2 and reusing flags for both `if(flag)` uses vs the orig's two cmp r2,#0. struct-guessed f24/f28.
 *   confidence: med
 */
/* func_020a342c (main, class C) — open a stream, size-check, conditionally
 * read, always close; return success bool.
 *   r0 = a, r1 = b, r2 = flag
 *
 * asm shape:
 *   size = flag ? 0x200 : 0x20;
 *   if (flag) b += 0x20;
 *   if (a == 0) return 0;
 *   func_02098388(&local);
 *   if (func_02098038(&local, a) == 0) return 0;
 *   if ((local.f28 - local.f24) != size) { func_02097ff0(&local); return 0; }
 *   func_02097f10(&local, b, size);
 *   func_02097ff0(&local);
 *   return 1;
 */

typedef struct {
    char _pad00[0x24];
    int  f24;   /* +0x24 */
    int  f28;   /* +0x28 */
    char _pad2c[0x48 - 0x2c];   /* pad to the 0x48 the orig reserves */
} a342c_local;  /* stack struct, 0x48 bytes */

extern void func_02098388(a342c_local *l);
extern int  func_02098038(a342c_local *l, void *a);
extern void func_02097ff0(a342c_local *l);
extern void func_02097f10(a342c_local *l, void *b, int size);

int func_020a342c(void *a, char *b, int flag)
{
    a342c_local local;
    int         size;

    size = flag ? 0x200 : 0x20;
    if (flag) b += 0x20;
    if (a == 0) return 0;

    func_02098388(&local);
    if (func_02098038(&local, a) == 0) return 0;

    if (size != local.f28 - local.f24) {   /* cmp r4(size), r0(delta); beq read */
        func_02097ff0(&local);
        return 0;
    }

    func_02097f10(&local, b, size);
    func_02097ff0(&local);
    return 1;
}
