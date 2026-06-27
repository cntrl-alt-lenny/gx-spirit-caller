/* CAMPAIGN-PREP candidate for func_021b5a54 (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch(B[19]-0x18) jump-table; case0/4 and case2/3 share arms; if-assign flag; store-order
 *   risk:       reshape-able: orig normalizes B[0] to bool (movne#1/moveq#0) before the branch; if plain `if(B[0])` omits it, write `int x=(B[0]!=0); if(x)` to force the normalize.
 *   confidence: med
 */
/* func_ov006_021b5a54 (ov006, class D): state-machine tick. A=022f398,
 * B=022e068, C=022f38c. If A[0]!=0 run sub-machine 021b5b70. Else if B[0]!=0
 * and gate(B)!=0, dispatch on (B[0x4c]-0x18): write A[0]/A[1] or set a flag.
 * Always then run two post fns; if flag set, C[0]=3. Returns the flag.
 *
 * The B[0]!=0 test normalizes to a bool (movne#1/moveq#0) before branching. */

extern int  data_ov006_0224f398[];   /* A */
extern int  data_ov006_0224e068[];   /* B */
extern int  data_ov006_0224f38c[];   /* C */
extern void func_ov006_021b5b70(void);
extern void func_ov006_021b596c(void);
extern void func_ov006_021b5994(void);
extern int  func_ov006_021c9efc(int *b);
extern void func_ov006_021ca3a0(int *b);

int func_ov006_021b5a54(void) {
    int flag = 0;

    if (data_ov006_0224f398[0] != 0) {
        func_ov006_021b5b70();
    } else if (data_ov006_0224e068[0] != 0) {
        if (func_ov006_021c9efc(data_ov006_0224e068) != 0) {
            switch (data_ov006_0224e068[0x4c / 4] - 0x18) {   /* B[19] */
            case 0:
            case 4:
                if (data_ov006_0224e068[0x48 / 4] != 0) {     /* B[18] */
                    flag = 1;
                } else {
                    data_ov006_0224f398[0] = 1;
                    data_ov006_0224f398[1] = 0;
                }
                break;
            case 1:
                data_ov006_0224f398[0] = 2;
                data_ov006_0224f398[1] =
                    data_ov006_0224f38c[0x14 / 4] != 0 ? 0x1a : 0x1c;  /* C[5] */
                break;
            case 2:
            case 3:
                flag = 1;
                break;
            }
            func_ov006_021ca3a0(data_ov006_0224e068);
        }
    } else {
        flag = 1;
    }

    func_ov006_021b596c();
    func_ov006_021b5994();
    if (flag != 0)
        data_ov006_0224f38c[0] = 3;
    return flag;
}
