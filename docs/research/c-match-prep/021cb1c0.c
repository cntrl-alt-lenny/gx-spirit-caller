/* CAMPAIGN-PREP candidate for func_021cb1c0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     tst guard; two calls; bic clear-bit; bound const for r3=r2 reuse
 *   risk:       mwcc may emit mov r3,#1 instead of mov r3,r2 despite local binding; field offsets guessed
 *   confidence: med
 */
/* func_ov002_021cb1c0: guard on d016c.f_d0 bit0; two 021b218c calls; clear
 * bit0; tail 021b2ab4; clear ce950.f_80c. The const 1 is bound to a local
 * so r3 reuses r2 (orig: mov r2,#1; mov r3,r2). */

typedef struct { char _a[0xd0]; unsigned int f_d0; } StateD016c;
typedef struct { char _a[0x16]; unsigned short f_16; } StateCf26c;
typedef struct { char _a[0x7e]; unsigned short f_7e; } StateCfa6c;
typedef struct { char _a[0x80c]; unsigned int f_80c; } StateCe950;

extern StateD016c data_ov002_022d016c;
extern StateCf26c data_ov002_022cf26c;
extern StateCfa6c data_ov002_022cfa6c;
extern StateCe950 data_ov002_022ce950;
extern void func_ov002_021b218c(int a, int b, int c, int d);
extern void func_ov002_021b2ab4(void);

void func_ov002_021cb1c0(void) {
    int one = 1;
    if (data_ov002_022d016c.f_d0 & 1) {
        func_ov002_021b218c(data_ov002_022cf26c.f_16, 0x19b8, one, one);
        func_ov002_021b218c(data_ov002_022cfa6c.f_7e, 0x19b8, one, one);
    }
    data_ov002_022d016c.f_d0 &= ~1u;
    func_ov002_021b2ab4();
    data_ov002_022ce950.f_80c = 0;
}
