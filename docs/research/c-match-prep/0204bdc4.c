/* CAMPAIGN-PREP candidate for func_0204bdc4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     SETTER f20c + call(byte fd+1) + branch: flag-bracketed call vs else call
 *   risk:       fd/f20c/f1a8 offsets; movs r4 zero-test selects branch; arg fd reload
 *   confidence: med
 */
/* func_0204bdc4: acc()->f20c = a0; r = func_02046770(a0, acc()->fd + 1);
 * if (r) { acc()->f1a8 = 2; func_0206255c(*(int*)r); acc()->f1a8 = 0; return 1; }
 * else   { func_0204fc38(a0, acc()->fd + 1); return 0; }  (acc reloaded each use) */

typedef struct {
    char          _pad0[0xd];
    unsigned char fd;   /* +0x0d */
    char          _pad1[0x19a];
    unsigned char f1a8; /* +0x1a8 */
    char          _pad2[0x63];
    int           f20c; /* +0x20c */
} State0204bdc4;

extern State0204bdc4 *func_020498f0(void);
extern int *func_02046770(int a0, int b);
extern void func_0206255c(int v);
extern void func_0204fc38(int a0, int b);

int func_0204bdc4(int a0) {
    int *r;
    func_020498f0()->f20c = a0;
    r = func_02046770(a0, func_020498f0()->fd + 1);
    if (r) {
        func_020498f0()->f1a8 = 2;
        func_0206255c(*r);
        func_020498f0()->f1a8 = 0;
        return 1;
    }
    func_0204fc38(a0, func_020498f0()->fd + 1);
    return 0;
}
