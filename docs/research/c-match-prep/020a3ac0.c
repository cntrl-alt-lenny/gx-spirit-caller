/* CAMPAIGN-PREP candidate for func_020a3ac0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     deref chain; call; cmp-eq cond-move clamp; tail return
 *   risk:       must route .legacy.c; `if(v==2)v=0;` must stay cmp+moveq not branch; r4 holds v across call; offset 0x508 guessed
 *   confidence: high
 */
/* func_020a3ac0 — deref-load-call, register dispatch, eq-zero clamp, return.
 * Style A epilogue (ldmia {r4,lr}; bx lr) -> ROUTE AS *.legacy.c (mwcc 1.2/sp2p3).
 * data_021a98f8: ptr; (*ptr)->f_508 (int) passed to func_0209f030.
 */

extern int  func_0209f030(int arg);
extern void func_020a35dc(int kind, int v);

typedef struct {
    char _pad[0x508];
    int  f_508;             /* +0x508 */
} state_t;

extern state_t *data_021a98f8;

int func_020a3ac0(void)
{
    int v = func_0209f030(data_021a98f8->f_508);
    func_020a35dc(1, v);
    if (v == 2)
        v = 0;
    return v;
}
