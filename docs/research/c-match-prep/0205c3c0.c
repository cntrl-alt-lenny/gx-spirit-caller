/* CAMPAIGN-PREP candidate for func_0205c3c0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     stack desc[6] passed by ptr; keep params callee-saved; bail-return per validator in order
 *   risk:       permuter-class: 5 callee-saved values (arg1,ctx,p2,p3,r4=func_020aaddc result) live across the whole pipeline; mwcc's allocation order for r4..r8 is a coin-flip vs orig and the desc[5]=desc[2] reload timing may shift.
 *   confidence: low
 */
/* func_0205c3c0: builds a 6-word local descriptor on the stack and runs it
 * through a fixed pipeline of validators (func_02058070 with three data
 * tags, func_02058038 twice, func_020580a0, func_020581a8), bailing with
 * the validator's nonzero status at each step. Two NULL-arg asserts up
 * front (func_020a6d54). Final step: func_0205407c(arg1[0x38], &desc),
 * then arg1[0x10] = func_02054b9c(0) + 0x12c. desc fields: [0x10]=p2 set
 * before the pipeline; [0x14]=desc[0x8] copied in just before func_020580a0.
 * arg1 (r7) and the four cached params are callee-saved live throughout. */

extern char data_02100b54[];
extern char data_02100b64[];
extern char data_02100ba4[];
extern char data_02100bb4[];
extern char data_02100bb8[];
extern char data_02100bc0[];
extern int  func_0205407c(void *a, void *desc);
extern int  func_02054b9c(int x);
extern int  func_02058038(void *ctx, void *desc, int v);
extern int  func_02058070(void *ctx, void *desc, void *tag);
extern int  func_020580a0(void *ctx, void *desc, int a, int b);
extern int  func_020581a8(void *ctx, void *desc, int z);
extern void func_020a6d54(void *a, void *b, int c, int d);
extern int  func_020aaddc(int x);

typedef struct Owner2 { char _pad[0x38]; void *slot38; char _pad2[0x10 - 0x04]; int f10; } Owner2;

int func_0205c3c0(void *ctx, void *arg1, int p2, int p3) {
    int desc[6];
    int r;

    if (arg1 == 0)
        func_020a6d54(data_02100b54, data_02100b64, 0, 0x340);
    if (p3 == 0)
        func_020a6d54(data_02100ba4, data_02100b64, 0, 0x341);

    r = func_020aaddc(p3);

    desc[0] = 0;
    desc[1] = 0;
    desc[2] = 0;
    desc[3] = 0;
    desc[4] = 0;
    desc[5] = 0;
    desc[4] = p2;

    if ((r = func_02058070(ctx, desc, data_02100bb4)) != 0) return r;
    if ((r = func_02058038(ctx, desc, p2)) != 0) return r;
    if ((r = func_02058070(ctx, desc, data_02100bb8)) != 0) return r;
    if ((r = func_02058038(ctx, desc, r)) != 0) return r;
    if ((r = func_02058070(ctx, desc, data_02100bc0)) != 0) return r;
    desc[5] = desc[2];
    if ((r = func_020580a0(ctx, desc, p3, r)) != 0) return r;
    if ((r = func_020581a8(ctx, desc, 0)) != 0) return r;

    func_0205407c(((Owner2 *)arg1)->slot38, desc);
    ((Owner2 *)arg1)->f10 = func_02054b9c(0) + 0x12c;
    return 0;
}
