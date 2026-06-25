/* CAMPAIGN-PREP candidate for func_021d637c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     u16-head index; 8-byte node struct; :4 kind bitfield; do/while
 *   risk:       struct-guessed: the 8-byte Ov002Node field offsets (id@0, kind:4@2, next@6) are inferred from ldrh #2/#6 — confirm vs real node. Also const-0 hoist (orig `mov r7,#0` before loop) may not reproduce.
 *   confidence: med
 */
/* func_ov002_021d637c: per-player row -> head index into the 8-byte node
 * array data_022d0650; walk the next-linked list, and for each node whose
 * :4 kind field equals arg2, fire 021de480 with the node's packed lo/hi
 * id bytes (cls C). struct offsets inferred — confirm vs the real node. */

extern char data_ov002_022cf1a6[];   /* row table (_LIT1), 0x868/player, u16 head at +0 */
struct Ov002Node {                   /* 8-byte node in data_022d0650 (_LIT2) */
    unsigned short id;               /* +0: packed lo|hi id bytes        */
    unsigned short kind : 4;         /* +2: lsl#28;lsr#28 -> :4           */
    unsigned short pad4;             /* +4                                */
    unsigned short next;             /* +6: next index (0 terminates)     */
};
extern struct Ov002Node data_ov002_022d0650[];

extern int func_ov002_021de480(int a, int b, int c, int d);

void func_ov002_021d637c(int arg0, int arg1, int arg2) {
    unsigned short cur =
        *(unsigned short *)(data_ov002_022cf1a6 + (arg0 & 1) * 0x868 + arg1 * 0x14);
    if (cur == 0)
        return;
    do {
        struct Ov002Node *n = &data_ov002_022d0650[cur];
        unsigned short kind = n->kind;
        unsigned short id;
        cur = n->next;
        if ((unsigned)arg2 == kind) {
            id = n->id;
            func_ov002_021de480(id & 0xff, (id >> 8) & 0xff, 0, 0);
        }
    } while (cur != 0);
}
