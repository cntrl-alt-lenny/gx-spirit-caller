/* CAMPAIGN-PREP candidate for func_0203244c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order; r6=result moveq 0; reload base into entry after head=0; ldrb [+1]==1 guard
 *   risk:       reshape-able: the early `beq .L_020324b4` after head=0 (count==0) keeps r6=0 then jumps to RestoreIrq; my nested early-return may emit an extra branch. Risk: control-flow shape, restructure as goto-to-restore if diverges.
 *   confidence: low
 */
typedef struct Ring {
    /* 0x00 */ int head;
    /* 0x04 */ int count;
    /* 0x08 */ char _pad08[4];
    /* 0x0c */ unsigned char *base;
} Ring;

extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int);

unsigned char *func_0203244c(Ring *ring, int *out)
{
    int saved;
    int head;
    unsigned char *entry;
    unsigned char *result;

    if (ring == 0)
        return 0;
    saved = OS_DisableIrq();
    head = ring->head;
    if (head == ring->count) {
        result = 0;
    } else {
        entry = ring->base + head;
        if (entry[1] == 1) {
            ring->head = 0;
            if (ring->count == 0) {
                result = 0;
                OS_RestoreIrq(saved);
                return result;
            }
            entry = ring->base + 0;
        }
        *out = *(unsigned short *)(entry + 2);
        result = entry + 4;
    }
    OS_RestoreIrq(saved);
    return result;
}
