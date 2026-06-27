/* CAMPAIGN-PREP candidate for func_02057f3c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order *outErr then *outOk; mvn => ==-N compares; ldrsb name as signed char
 *   risk:       stack params sp+0x18/0x1c/0x20 mapped outErr=r5,outOk=r6,name=r4; if mwcc binds these in other regs the bl arg-loads differ. reshape-able.
 *   confidence: med
 */
/* func_02057f3c (D): open file, map error codes to status, branchy tail. */
extern int  func_02054bfc(int h);
extern int  func_02054cf8(int h, int a, int b, int z);
extern int  func_020585d4(int ctx, int a, int b);
extern int  func_0205ffd4(int ctx, int code, void *lit);
extern int  func_0205ffc0(int ctx, void *lit);
extern int  func_020604a4(int ctx, void *lit, signed char *name);
extern unsigned char data_021001f4[], data_0210021c[];
int func_02057f3c(int ctx, int h, int a, int b, int four, int *outErr, int *outOk, signed char *name) {
    int rc = func_02054cf8(h, a, b, 0);
    if (rc == -1) {
        rc = func_02054bfc(h);
        if (rc == -6 || rc == -0x1a || rc == -0x4c) {
            *outErr = 0;
            *outOk = 0;
            return 0;
        }
        if (name[0] == 0x50) {
            if (name[1] == 0x52)
                return 3;
        }
        func_0205ffd4(ctx, 5, data_021001f4);
        func_020585d4(ctx, 3, 0);
        return 3;
    }
    if (rc != 0) {
        *outErr = rc;
        *outOk = 0;
        return 0;
    }
    func_020604a4(ctx, data_0210021c, name);
    *outErr = 0;
    *outOk = 1;
    return 0;
}
