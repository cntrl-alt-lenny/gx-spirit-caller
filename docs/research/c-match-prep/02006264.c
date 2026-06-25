/* CAMPAIGN-PREP candidate for func_02006264 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reuse func_02006228 guard; dx first (f_1c-f_14) then dy; mla dy*dy+dx*dx
 *   risk:       reshape-able: operand/decl order is load-bearing — dx (f_1c-f_14, into r1=dx*dx) must be computed BEFORE dy so the final mla is mla(dy,dy,dx2). The asm reloads &d74 for the second field group (separate ldr after the call). If mwcc keeps one base across all 5 loads, several ldr offsets diverge -> may go permuter-class.
 *   confidence: med
 */
/* func_02006264: same bit1 guard as func_02006228, then a guarded
 * distance-squared test: dx=[0x1c]-[0x14], dy=[0x18]-[0x10],
 * return (dx*dx + dy*dy < 0x64). Else 0.
 *
 *   guard: bit1 of [0x28]; func_020061bc(low30 of [0x20]) < 2 -> ret0
 *   r3=[0x1c]; r1=[0x14]; r2=[0x18]; r3=r3-r1; r1=r3*r3
 *   r0=[0x10]; r2=r2-r0; r0 = r2*r2 + r1
 *   if (r0 < 0x64) return 1; else 0
 */

typedef struct {
    char         _pad_00[0x10];
    int          f_10;
    int          f_14;
    int          f_18;
    int          f_1c;
    unsigned int f_20;             /* +0x20 */
    char         _pad_24[0x4];
    unsigned int _b0  : 1;         /* +0x28 */
    unsigned int bit1 : 1;
    unsigned int _hi  : 30;
} state_02103d74_t;

extern state_02103d74_t data_02103d74;
extern int func_020061bc(unsigned int x);

int func_02006264(void) {
    int dx, dy;
    if (data_02103d74.bit1) {
        if (func_020061bc(data_02103d74.f_20 & 0x3fffffff) >= 2) {
            dx = data_02103d74.f_1c - data_02103d74.f_14;
            dy = data_02103d74.f_18 - data_02103d74.f_10;
            if (dx * dx + dy * dy < 0x64) {
                return 1;
            }
        }
    }
    return 0;
}
