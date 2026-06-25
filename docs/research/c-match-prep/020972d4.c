/* CAMPAIGN-PREP candidate for func_020972d4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     busy then !busy cmov pair; reload f1c each use; do-while spin
 *   risk:       two-step bool->!bool may collapse to single test; &sub14 offset 0x14 guessed; spin reload ordering.
 *   confidence: med
 */
// func_020972d4 — IRQ-guarded flag toggle with spin-drain
// Recipe: bool then !bool cmov pair; reload field each use; spin loop.

extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int token);
extern void func_02091a8c(void *q);

typedef struct {
    unsigned char pad14[0x14];
    unsigned char sub14[0x8];   // 0x14 (passed to func_02091a8c)
    unsigned int f1c;           // 0x1c
} Obj020972d4;

int func_020972d4(Obj020972d4 *p)
{
    int token;
    int busy;
    int idle;

    token = OS_DisableIrq();

    busy = (p->f1c & 0x8) != 0;
    idle = !busy;

    if (idle) {
        if (p->f1c & 0x10) {
            p->f1c |= 0x40;
            do {
                func_02091a8c(&p->sub14);
            } while (p->f1c & 0x40);
        } else {
            p->f1c |= 0x8;
        }
    }

    OS_RestoreIrq(token);
    return idle;
}
