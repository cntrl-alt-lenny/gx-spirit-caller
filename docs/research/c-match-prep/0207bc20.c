/* CAMPAIGN-PREP candidate for func_0207bc20 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: bind g once for null-check+state read; cmp-chain switch (sparse); mask in r4 across calls
 *   risk:       reshape-able/permuter-class: sparse cmp/beq chain order (3,6,7) must match - mwcc may emit a jump-table or reorder comparisons; case-6 reloads data_021a088c for f2280 store (ldr r0,[r0]) not reusing g.
 *   confidence: med
 */
/* func_0207bc20: IRQ-bracketed state dispatch returning codes.
 * mask=DisableIrq; g=*data; if(g==0){Restore;return 1;}
 * switch(g->state(0x2260)): 3->Restore,return0; 6->set(7),g->f2280(0x2280)=4,fall;
 * 7->Restore,return2; default->Restore,return1.
 * The case-6 'fall' path does mov r0,r4;Restore;return3. r4=mask held across. */
typedef unsigned short u16;
typedef unsigned char  u8;

typedef struct {
    u8  _pad0[0x2260];
    int state;         /* +0x2260 */
    u8  _pad1[0x1c];
    u16 f2280;         /* +0x2280 */
} GxState;

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern GxState *data_021a088c;
extern void func_0207b038(int code);

int func_0207bc20(void) {
    int mask = OS_DisableIrq();
    GxState *g = data_021a088c;
    if (g == 0) {
        OS_RestoreIrq(mask);
        return 1;
    }
    switch (g->state) {
    case 3:
        OS_RestoreIrq(mask);
        return 0;
    case 6:
        func_0207b038(7);
        data_021a088c->f2280 = 4;
        OS_RestoreIrq(mask);
        return 3;
    case 7:
        OS_RestoreIrq(mask);
        return 2;
    default:
        OS_RestoreIrq(mask);
        return 1;
    }
}
