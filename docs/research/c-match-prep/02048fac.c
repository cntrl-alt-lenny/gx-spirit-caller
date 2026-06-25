/* CAMPAIGN-PREP candidate for func_02048fac (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind g->f44 across cmp; reload g after blx; mla stride 0xc inline
 *   risk:       blx r2 call passes f48 in r1 with r0 garbage (2-arg shape, r0 uninit); my 1-arg f44(f48) likely emits r0=arg not r1 -> arg-position diverges. permuter-class/struct-guessed.
 *   confidence: low
 */
/* func_02048fac (main, class C). g = *data_0219dc80 (State*).
 * If g->f44 (fn-ptr) != 0 AND g->f0 != 1: call (*g->f44)(g->f48).
 * Then reload g; if g->f34 != 0: o = func_020498c4(&buf, g->f18 + a*0xc);
 * call (*g->f34)(a, &buf, g->f38, o). 0x210 stack scratch. */

typedef int  (*Fn44_t)(int x);
typedef int  (*Fn34_t)(int a, void *buf, int f38, int o);

typedef struct State02048fac {
    int            f0;          /* +0x00 mode (==1 skips call) */
    char           _pad0[0x14];
    int            f18;         /* +0x18 array base */
    char           _pad1[0x18];
    Fn34_t         f34;         /* +0x34 dispatch fn-ptr */
    int            f38;         /* +0x38 */
    char           _pad2[0x8];
    Fn44_t         f44;         /* +0x44 pre fn-ptr */
    int            f48;         /* +0x48 */
} State02048fac;

extern State02048fac *data_0219dc80;
extern int func_020498c4(void *buf, int rec);

void func_02048fac(int a) {
    char buf[0x108];
    Fn44_t f44 = data_0219dc80->f44;
    if (f44 != 0 && data_0219dc80->f0 != 1) {
        f44(data_0219dc80->f48);
    }
    if (data_0219dc80->f34 != 0) {
        int o = func_020498c4(buf, data_0219dc80->f18 + a * 0xc);
        data_0219dc80->f34(a, buf, data_0219dc80->f38, o);
    }
}
