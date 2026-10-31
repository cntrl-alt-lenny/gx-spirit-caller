typedef struct Node {
    struct Node *next;
    void (*callback)(unsigned);
    unsigned arg;
} Node;
typedef struct Context {
    unsigned unused, start, size, extra;
} Context;
/* The assembly primitive returns the saved IRQ mask in r0. */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int unused0);
extern Node *data_021aa480;

void func_020987a4(Context *ctx) {
    for (;;) {
        Node *first;
        Node *last;
        unsigned start = ctx->start;
        unsigned end = start + (ctx->size + ctx->extra);
        first = 0;
        last = 0;
        int saved = OS_DisableIrq();
        Node *prev;
        Node *head = data_021aa480;
        prev = 0;
        Node *node = head;
        while (node) {
            Node *next;
            unsigned arg = node->arg;
            next = node->next;
            unsigned callback = (unsigned)node->callback;
            if ((arg == 0 && callback >= start && callback < end) ||
                (arg >= start && arg < end)) {
                if (last) last->next = node;
                else first = node;
                if (head == node) {
                    data_021aa480 = next;
                    head = next;
                }
                node->next = 0;
                last = node;
                if (prev) prev->next = next;
            } else {
                prev = node;
            }
            node = next;
        }
        OS_RestoreIrq(saved);
        if (!first) return;
        do {
            Node *next = first->next;
            if (first->callback) first->callback(first->arg);
            first = next;
        } while (first);
    }
}


