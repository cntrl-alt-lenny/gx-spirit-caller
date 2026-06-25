/* CAMPAIGN-PREP candidate for func_0206da98 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     s8 field test; boolean temp (||) gates single call; return 0
 *   risk:       named-bool temp may or may not materialize the r1 flag (mov #1/movne #0) shape; field 0x73 sign/offset guessed
 *   confidence: med
 */
/* func_0206da98: s = (s8)(arg->_4)->_73; call func_02070c40() iff
 * (s == 0 || s == 4); return 0.
 */

typedef struct {
    char _pad_00[0x73];
    signed char f73;       /* +0x73 */
} Sub;

typedef struct {
    char  _pad_00[0x4];
    Sub  *sub;             /* +0x4 */
} Obj;

extern void func_02070c40(void);

int func_0206da98(Obj *arg) {
    int s = arg->sub->f73;
    int doit = (s == 0 || s == 4);
    if (doit)
        func_02070c40();
    return 0;
}
