/* CAMPAIGN-PREP candidate for func_021b0930 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     state-guard short-circuit; bit0 bitfield; if(!r)r=f() OR-chain; value-map; tail dispatch
 *   risk:       ships .s today (reg-alloc wall): r/r2/r4 colouring, store-value cmov, and the d14 cmp-twice likely diff
 *   confidence: low
 */
/* func_ov002_021b0930: state-3 short-circuit, then a busy/active OR-test, then a
 * sequential `if(!r) r=next()` predicate OR-chain, store its bool to d016c.f3348,
 * and on the all-false path dispatch on cd744[player]. Returns a bool/0.
 *
 * d016c base offsets: 0xcec(player) 0xd0c 0xe0 0xd14 ; cd73c+8 ; cd968+0x300(bit0)
 */

extern char data_ov002_022cd73c[];
extern int  data_ov002_022cd744[];
extern char data_ov002_022cd968[];
extern char data_ov002_022d016c[];
extern int  func_ov002_021ae7a8(void);
extern int  func_ov002_021b04c8(void);
extern void func_ov002_021b08a8(void);
extern int  func_ov002_021b1254(void);
extern int  func_ov002_021b141c(void);
extern int  func_ov002_021e73a4(void);
extern void func_ov002_02269b90(void);
extern int  func_ov002_0226a928(void);
extern int  func_ov002_02279b84(void);
extern int  func_ov002_0229cd54(void);

struct Cd968 { unsigned int b0 : 1; };

int func_ov002_021b0930(void) {
    int player = *(int *)(data_ov002_022d016c + 0xcec);
    int r;

    if (*(int *)(data_ov002_022cd73c + 0x8) == 3) {
        return func_ov002_0229cd54();
    }

    if ((*(int *)(data_ov002_022d016c + 0xd0c) != 0 &&
         ((struct Cd968 *)(data_ov002_022cd968 + 0x300))->b0) ||
        *(int *)(data_ov002_022d016c + 0xe0) != 0) {
        return 1;
    }

    r = func_ov002_021ae7a8();
    if (r == 0) r = func_ov002_021b1254();
    if (r == 0) r = func_ov002_0226a928();
    if (r == 0) r = func_ov002_02279b84();
    if (r == 0) r = func_ov002_021b141c();
    if (r == 0) r = func_ov002_021e73a4();

    *(int *)(data_ov002_022d016c + 0xd14) = (r == 0) ? 1 : 0;
    if (r != 0) {
        return 0;
    }

    if (func_ov002_021b04c8() != 0) {
        return 1;
    }

    if (data_ov002_022cd744[player] == 2) {
        func_ov002_02269b90();
    } else {
        func_ov002_021b08a8();
    }
    return 0;
}
