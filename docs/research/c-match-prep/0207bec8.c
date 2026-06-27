/* CAMPAIGN-PREP candidate for func_0207bec8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: bind g once; two sparse cmp-chain switches; pass fn ptr as arg; mask in r4 across
 *   risk:       permuter-class: outer (1,3,4) and inner (2,3,8) cmp/beq orderings must match exactly; mwcc may reorder branches or fold cases. Inner case-2 reloads data_021a088c for f2280 store. func_0207ab68 passed as data pointer.
 *   confidence: low
 */
/* func_0207bec8: IRQ-bracketed state dispatch + nested sub-call switch.
 * mask=DisableIrq; g=*data; if(g==0){Restore;return1;}
 * switch(g->state(0x2260)): 1->Restore,return0; 4->Restore,return2;
 * default->Restore,return1; case3-> r=func_0209f0d8(func_0207ab68); switch(r):
 *   2-> set(4), g->f2280(0x2280)=2, ->return3 (mask reload r4);
 *   8-> Restore(mask),return4; 3/default-> set(0xb),Restore(mask),return7. */
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
extern int  func_0209f0d8(void *arg);
extern void func_0207ab68(void);

int func_0207bec8(void) {
    int mask = OS_DisableIrq();
    GxState *g = data_021a088c;
    if (g == 0) {
        OS_RestoreIrq(mask);
        return 1;
    }
    switch (g->state) {
    case 1:
        OS_RestoreIrq(mask);
        return 0;
    case 4:
        OS_RestoreIrq(mask);
        return 2;
    case 3: {
        int r = func_0209f0d8(func_0207ab68);
        switch (r) {
        case 2:
            func_0207b038(4);
            data_021a088c->f2280 = 2;
            OS_RestoreIrq(mask);
            return 3;
        case 8:
            OS_RestoreIrq(mask);
            return 4;
        case 3:
        default:
            func_0207b038(0xb);
            OS_RestoreIrq(mask);
            return 7;
        }
    }
    default:
        OS_RestoreIrq(mask);
        return 1;
    }
}
