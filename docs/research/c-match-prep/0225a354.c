/* CAMPAIGN-PREP candidate for func_0225a354 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     long guard chain of calls + mla 2D-table tail; ship-as-.s class
 *   risk:       already shipped whole-fn .s (brief 302, reg-alloc-walled): the 13-call r4/r5/r6 allocation, arg-eval order (r2 literal first), and mla table index (b*20+(a&1)*0x868) will almost certainly diff
 *   confidence: low
 */
/* func_ov002_0225a354: long linear pre-condition chain for a move legality
 * check. Currently shipped as whole-function .s (reg-alloc-walled). C attempt
 * for the front-loading pass; expect register-allocation residue.
 *
 * Chain (early-out values shown):
 *   021be2d8(a,b,0)==0                 -> return 1
 *   021b3ecc(a,11,0x15ff/0x14a6/0x1669)!=0 -> return 0
 *   021bb068(0x1443)!=0                -> return 0
 *   021baca8(a,b,0x16bf)!=0            -> return 0
 *   021baca8(a,b,0x1a79)!=0 && table[(a&1)][b]!=0 -> return 0
 *   021b4054(a,b,0x16cb,4)!=0          -> return 0
 *   021b3ecc(1-a,11,0x177a)!=0         -> return 0
 *   021b314c(a,b,0x1561/0x1852)!=0     -> return 0
 *   021b359c(1-a,0x1318)!=0 && 021c1d28(a,b,1)==0 -> return 0
 *   else                               -> return 1
 */

extern char data_ov002_022cf1a8[];
extern int func_ov002_021be2d8(int a, int b, int c);
extern int func_ov002_021b3ecc(int player, int kind, int code);
extern int func_ov002_021bb068(int code);
extern int func_ov002_021baca8(int a, int b, int code);
extern int func_ov002_021b4054(int a, int b, int code, int d);
extern int func_ov002_021b314c(int a, int b, int code);
extern int func_ov002_021b359c(int a, int code);
extern int func_ov002_021c1d28(int a, int b, int c);

int func_ov002_0225a354(int a, int b) {
    if (func_ov002_021be2d8(a, b, 0) == 0)
        return 1;
    if (func_ov002_021b3ecc(a, 0xB, 0x15FF) != 0)
        return 0;
    if (func_ov002_021b3ecc(a, 0xB, 0x14A6) != 0)
        return 0;
    if (func_ov002_021b3ecc(a, 0xB, 0x1669) != 0)
        return 0;
    if (func_ov002_021bb068(0x1443) != 0)
        return 0;
    if (func_ov002_021baca8(a, b, 0x16BF) != 0)
        return 0;
    if (func_ov002_021baca8(a, b, 0x1A79) != 0 &&
        *(int *)(data_ov002_022cf1a8 + (a & 1) * 0x868 + b * 0x14) != 0)
        return 0;
    if (func_ov002_021b4054(a, b, 0x16CB, 4) != 0)
        return 0;
    if (func_ov002_021b3ecc(1 - a, 0xB, 0x177A) != 0)
        return 0;
    if (func_ov002_021b314c(a, b, 0x1561) != 0)
        return 0;
    if (func_ov002_021b314c(a, b, 0x1852) != 0)
        return 0;
    if (func_ov002_021b359c(1 - a, 0x1318) != 0 &&
        func_ov002_021c1d28(a, b, 1) == 0)
        return 0;
    return 1;
}
