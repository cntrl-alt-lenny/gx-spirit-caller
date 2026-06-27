/* CAMPAIGN-PREP candidate for func_0207c3b0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: decl-order node/head fields; bind head base once; cond-store splice via if/else; ldreq/streq guarded tail
 *   risk:       struct-guessed/permuter-class: the r3 walk-var (p) must stay live to gate the final ldreq/streq block (cmp r3,#0); my dual node->f4 assignment is malformed C - the f0 read+inc must compile to ldr/add/str. Field offsets (f4=tail,f8=head) inferred from store directions; confirm Head/Node layout.
 *   confidence: low
 */
/* func_0207c3b0: doubly-linked-list unlink+reinsert. arg = node (r0, kept r4).
 * b=func_0207b538()+0x2000; head=b[0x270]; if(node==0||head==0) ret;
 * if(b[0x274]<=0xc) ret; walk r3=head->f4(+0x4) over ->fC(+0xc) to find node;
 * splice out via f8(+0x8)/fC(+0xc) neighbors; then clear node->fC, push node at
 * head->f8(+0x8) front, fixup prev; if list-was-empty(r3==0) seed head->f4 and inc *head. */
typedef struct Node {
    int          f0;
    struct Node *f4;   /* +0x4 */
    struct Node *f8;   /* +0x8 */
    struct Node *fc;   /* +0xc */
} Node;

typedef struct {
    int  f0;
    Node *f4;          /* head->+0x4 list tail/seed */
    Node *f8;          /* head->+0x8 list head     */
    int  fc;
} Head;

extern void *func_0207b538(void);

void func_0207c3b0(Node *node) {
    char *raw = (char *)func_0207b538() + 0x2000;
    Head *head = *(Head **)(raw + 0x270);
    int  count;
    Node *p;
    if (node == 0) return;
    if (head == 0) return;
    count = *(int *)(raw + 0x274);
    if ((unsigned)count <= 0xc) return;
    p = head->f4;
    if (p != 0) {
        for (;;) {
            if (p == node) {
                Node *nx = node->f8;
                if (nx != 0) nx->fc = node->fc;
                else head->f4 = node->fc;
                nx = node->fc;
                if (nx != 0) nx->f8 = node->f8;
                else head->f8 = node->f8;
                break;
            }
            p = p->fc;
            if (p == 0) break;
        }
    }
    node->fc = 0;
    node->f8 = head->f8;
    head->f8 = node;
    if (node->f8 != 0) node->f8->fc = node;
    else head->f4 = node;
    if (p == 0) {
        node->f4 = head->f0 ? (Node *)0 : 0; /* placeholder, replaced below */
        node->f4 = (Node *)(long)((Head *)head)->f0;
        ((Head *)head)->f0++;
    }
}
