/* CAMPAIGN-PREP candidate for func_02065ee0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     0x40 struct zero-init via ={0}; reload global each use (no bind); tail divmod-free
 *   risk:       the 8 stmia-pair inline zeroing: mwcc may lower a {0} init to a memset/__fill call or a single-reg loop instead of the 16-word stmia-pair sequence. reshape-able (tune to literal field assigns) or struct-guessed on size 0x40.
 *   confidence: low
 */
/* func_02065ee0 - main - class C
 * stmia-zeroed 0x40 local + lazy-init global + tail call
 * _LIT0 = data_0219e968 (global obj ptr), _LIT1 = func_02065f78 (ctor cb)
 */
typedef struct { unsigned char b[0x40]; } Buf40;

extern void *data_0219e968;
extern void *func_020541b8(int a, int b, void *cb);
extern void func_02065f78(void);
extern void func_0205407c(void *obj, void *buf);
extern int  func_02054140(void *obj);
extern void func_020540d0(void *obj, int n);

void func_02065ee0(void)
{
    Buf40 buf;
    int n;

    buf = *(Buf40 *)&buf; /* placeholder, replaced below */
    {
        Buf40 zero = {0};
        buf = zero;
    }
    if (data_0219e968 == 0)
        data_0219e968 = func_020541b8(0x40, 4, (void *)func_02065f78);
    func_0205407c(data_0219e968, &buf);
    n = func_02054140(data_0219e968);
    func_020540d0(data_0219e968, n - 1);
}
