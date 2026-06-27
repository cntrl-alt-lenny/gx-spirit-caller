/* CAMPAIGN-PREP candidate for func_02010354 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: hold B base, unsigned >>12 gaps, rsb operand-order, align-up tail tst
 *   risk:       the gap subtractions use rsb (reversed sub: end - x) so operand order is (a>>12) - end; if C emits sub in the other order the rsb becomes sub+neg. tail align-up is tst r3,#0xf / addne+bicne — reshape-able via if(r3&0xf)
 *   confidence: low
 */
/* func_02010354 (main, class C) — free-space walk with align-up tail.
 * A=data_0218dbc8(+0x910 head), B=data_0218cbc8(+0x1000). arg0->f4 = request.
 * If list empty: return *(B+0x930). Else walk gaps (cur->fc>>12 etc), test fit,
 * else final gap to (B+0x934); on overflow return 0x80000. Tail: align r3 up to 16. */

typedef struct Node {
    struct Node *next;  /* 0x0 */
    int          pad4;  /* 0x4 */
    unsigned int fc;    /* 0xc */
    unsigned int f10;   /* 0x10 */
} Node;

extern char data_0218dbc8;  /* A */
extern char data_0218cbc8;  /* B */

int func_02010354(int *arg)
{
    char *B = &data_0218cbc8 + 0x1000;
    Node *head = *(Node **)(&data_0218dbc8 + 0x910);
    unsigned int r3;

    if (head == 0) {
        return *(int *)(B + 0x930);
    }
    {
        unsigned int b930 = *(unsigned int *)(B + 0x930);
        unsigned int want = (unsigned int)arg[1];
        unsigned int gap  = (head->fc >> 12) - b930;
        if (want <= gap) {
            r3 = b930;
        } else {
            Node *cur = head;
            Node *nx  = head->next;
            if (nx != 0) {
                for (;;) {
                    unsigned int end = cur->f10 + (cur->fc >> 12);
                    unsigned int g2  = (nx->fc >> 12) - end;
                    if (want <= g2) { r3 = end; goto done; }
                    cur = nx;
                    nx  = nx->next;
                    if (nx == 0) break;
                }
            }
            {
                unsigned int end  = cur->f10 + (cur->fc >> 12);
                unsigned int last = *(unsigned int *)(B + 0x934) - end;
                if (want > last) return 0x80000;
                r3 = end;
            }
        }
    }
done:
    if (r3 & 0xf) r3 = (r3 + 0xe) & ~0xfu;
    return (int)r3;
}
