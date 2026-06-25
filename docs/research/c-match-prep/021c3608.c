/* CAMPAIGN-PREP candidate for func_021c3608 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :13/:1 bitfields; if-assign exits; cf288 scalar markers; bit17 flag read
 *   risk:       asm body is TRUNCATED (.L_340 success-tail not shown) and LIT3/LIT4 globals are GUESSED (cf188 pool + a data ptr). struct-guessed; multi-exit dispatch likely needs .s escape. confirm globals + tail.
 *   confidence: low
 */
/* func_ov002_021c3608: gate on entry id = (:13) of ((int*)(row+0x5d0))[arg2],
 * row=cf16c+(arg1&1)*0x868. Sequence: if !func_02030808(id) return 0; if
 * func_0203058c(id): require bit14(id)!=0 else 0, then if func_0202e310(id):
 * require func_021bbe8c(arg0)!=0; else (058c==0 path) require
 * func_021ca440(arg0,id)!=0. Then marker dispatch on id vs cf288 / cf288+0x7c.
 * NOTE: tail label .L_340 (success=return 1) is past the listed body and
 * LIT3/LIT4 globals are inferred (cf188 flag pool / a data ptr). */
extern char data_ov002_022cf16c[];
extern int  data_ov002_022cf188[];
extern int  data_ov002_022cf288;
extern int  func_02030808(unsigned int id);
extern int  func_0203058c(unsigned int id);
extern int  func_0202e310(unsigned int id);
extern int  func_ov002_021bbe8c(int arg0);
extern int  func_ov002_021bb90c(int arg0, int marker);
extern int  func_ov002_021b3ecc(int arg0, int n, void *p);
extern int  func_ov002_021ca440(int arg0, unsigned int id);
extern void *data_ov002_022cf_lit4;

struct Ov002Id13   { unsigned int v : 13; };
struct Ov002Bit14  { unsigned int : 14; unsigned int b : 1; };
struct Ov002Bit17  { unsigned int : 17; unsigned int b : 1; };

int func_ov002_021c3608(int arg0, int player, int arg2) {
    int idx = (player & 1) * 0x868;
    char *row = (char *)data_ov002_022cf16c + idx;
    int *idp = (int *)(row + 0x5d0);
    unsigned int id = ((struct Ov002Id13 *)&idp[arg2])->v;
    if (func_02030808(id) == 0)
        return 0;
    if (func_0203058c(id) != 0) {
        if (((struct Ov002Bit14 *)&idp[arg2])->b == 0)
            return 0;
        if (func_0202e310(id) != 0) {
            if (func_ov002_021bbe8c(arg0) == 0)
                return 0;
        }
        if (id == (unsigned int)data_ov002_022cf288) {
            if (func_ov002_021bb90c(arg0, data_ov002_022cf288 - 0xe8) == 0)
                return 0;
        } else if (id == (unsigned int)data_ov002_022cf288 + 0x7c) {
            if (((struct Ov002Bit17 *)((char *)data_ov002_022cf188 + (arg0 & 1) * 0x868))->b != 0)
                return 0;
            if (func_ov002_021b3ecc(arg0, 0xb, &data_ov002_022cf_lit4) == 0)
                return 0;
        }
        return 1;
    }
    return func_ov002_021ca440(arg0, id) != 0 ? 1 : 0;
}
