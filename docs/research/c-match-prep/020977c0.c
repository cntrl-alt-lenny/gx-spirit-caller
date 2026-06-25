/* CAMPAIGN-PREP candidate for func_020977c0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     head reload; test-first while; next@0x4 key@0x0; return node
 *   risk:       OS_DisableIrq token threading; loop ordering (b to test) usually matches; key field type int vs ptr.
 *   confidence: high
 */
// func_020977c0 — IRQ-guarded singly-linked list key search
// Recipe: head reload, for-loop test-first, next@0x4 key@0x0, return node.

extern int func_02097d60(void);
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int token);

typedef struct Node020977c0 {
    int key;                       // 0x00
    struct Node020977c0 *next;     // 0x04
} Node020977c0;

extern Node020977c0 *data_021a8308;

Node020977c0 *func_020977c0(void)
{
    int key;
    int token;
    Node020977c0 *n;

    key = func_02097d60();
    token = OS_DisableIrq();

    n = data_021a8308;
    while (n != 0) {
        if (n->key == key) {
            break;
        }
        n = n->next;
    }

    OS_RestoreIrq(token);
    return n;
}
