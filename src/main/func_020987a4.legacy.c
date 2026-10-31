typedef struct Callback {
    struct Callback *next;
    void (*callback)(unsigned);
    unsigned argument;
} Callback;
typedef struct Range {
    unsigned unused;
    unsigned start;
    unsigned size;
    unsigned extra;
} Range;
/* The assembly primitive returns the prior IRQ mask in r0. */
extern unsigned OS_DisableIrq(void);
extern void OS_RestoreIrq(int unused0);
extern Callback *data_021aa480;

void func_020987a4(Range *range) {
    for (;;) {
        Callback *head;
        Callback *tail;
        unsigned start = range->start;
        unsigned end = start + (range->size + range->extra);
        head = 0;
        tail = 0;
        unsigned irq = OS_DisableIrq();
        Callback *prev;
        Callback *first = data_021aa480;
        prev = 0;
        Callback *node = first;
        while (node != 0) {
            Callback *next;
            unsigned arg = node->argument;
            void (*cb)(unsigned);
            next = node->next;
            cb = node->callback;
            if ((arg == 0 && (unsigned)cb >= start && (unsigned)cb < end) ||
                (arg >= start && arg < end)) {
                if (tail != 0) tail->next = node;
                else head = node;
                if (first == node) {
                    data_021aa480 = next;
                    first = next;
                }
                node->next = 0;
                tail = node;
                if (prev != 0) prev->next = next;
            } else {
                prev = node;
            }
            node = next;
        }
        OS_RestoreIrq(irq);
        if (head == 0) return;
        do {
            void (*cb)(unsigned) = head->callback;
            Callback *next = head->next;
            if (cb != 0) cb(head->argument);
            head = next;
        } while (head != 0);
    }
}



