typedef struct Node {
    struct Node *next;
    unsigned int active : 1;
    unsigned int priority : 31;
    int value;
    void *arg;
} Node;
typedef struct {
    char _pad[0x64];
    unsigned int flag;
} ctx_020919d8_t;
typedef struct {
    char pad[0xc0];
    Node *volatile head;
    Node sentinel;
} Context;
extern Context *data_021a9920;
/* The IRQ primitive returns the old mask in r0 despite its assembly C wrapper. */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int unused0);
extern int func_020a5878(void);
extern void func_02093bfc(void);
extern int func_02091814(void *p);
extern void func_020919d8(ctx_020919d8_t *ctx);

void func_020a56bc(Node *node, int value, void *arg, unsigned int priority) {
    Context *ctx = data_021a9920;
    int saved;
    Node *cur;
    Node *next;
    unsigned int current;
    if (!func_020a5878()) func_02093bfc();
    if (node->active) func_02093bfc();
    if (priority > 31) {
        current = func_02091814(ctx);
        if (priority == 32) priority = current ? current - 1 : 0;
        else if (priority == 33) priority = current < 31 ? current + 1 : 31;
        else if (priority == 34) priority = current;
        else priority = 31;
    }
    saved = OS_DisableIrq();
    node->active = 1;
    node->priority = priority;
    node->value = value;
    node->arg = arg;
    if (ctx->head == 0) {
        if (node == &ctx->sentinel) data_021a9920 = 0;
        ctx->head = node;
        func_020919d8((ctx_020919d8_t *)ctx);
    } else {
        cur = ctx->head;
        if (node == &ctx->sentinel) {
            while (cur->next) cur = cur->next;
            cur->next = node;
            data_021a9920 = 0;
        } else {
            if (cur->priority > priority) {
                ctx->head = node;
                node->next = cur;
            } else {
                while ((next = cur->next) != 0 && next->priority <= priority) cur = next;
                node->next = next;
                cur->next = node;
            }
        }
    }
    OS_RestoreIrq(saved);
}

