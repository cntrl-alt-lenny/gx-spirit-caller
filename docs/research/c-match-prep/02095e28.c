/* CAMPAIGN-PREP candidate for func_02095e28 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     pre-call; indexed store off 0x3C stride 4; call on &elem
 *   risk:       address math (add base+0x3c, +idx<<2 split across r0/r2) may schedule differently; func_020928e8 arg count guessed (2).
 *   confidence: low
 */
// func_02095e28 — indexed field store then fixed-size call wrapper
// Recipe: pre-call, arr[idx]=val at off 0x3C stride 4, call on &arr[idx].

extern void func_020952e4(void);
extern void func_020928e8(void *dst, int n);
extern void func_020952d0(void);

typedef struct {
    unsigned char pad[0x3c];
    int field[1];
} Obj02095e28;

void func_02095e28(Obj02095e28 *p, int idx, int val)
{
    func_020952e4();
    p->field[idx] = val;
    func_020928e8(&p->field[idx], 4);
    func_020952d0();
}
