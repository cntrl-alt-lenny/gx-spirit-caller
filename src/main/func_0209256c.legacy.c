typedef struct Container {
    void *head;
    void *f04;
} Container;
typedef struct {
    Container send;
    Container receive;
    void **messages;
    int capacity;
    int first;
    int count;
} Queue;
/* OS_DisableIrq returns the saved IRQ mask in r0. */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int unused0);
extern void func_02091a8c(void *q);
extern void func_02091a0c(Container *c);
extern long long func_020b3870(int a, int b);

int func_0209256c(Queue *q, void *message, int flags)
{
    int saved = OS_DisableIrq();
    if (q->capacity <= q->count) {
        int block = flags & 1;
        do {
            if (block == 0) {
                OS_RestoreIrq(saved);
                return 0;
            }
            func_02091a8c(q);
        } while (q->capacity <= q->count);
    }
    q->messages[(int)((unsigned long long)func_020b3870(q->first + q->count, q->capacity) >> 32)] = message;
    q->count = q->count + 1;
    func_02091a0c(&q->receive);
    OS_RestoreIrq(saved);
    return 1;
}
