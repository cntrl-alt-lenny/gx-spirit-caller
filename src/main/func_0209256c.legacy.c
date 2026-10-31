typedef struct Container { void *head; void *f04; } Container;
typedef struct Queue {
    Container send;
    Container receive;
    void **buffer;
    int capacity;
    int first;
    int count;
} Queue;
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern void func_02091a8c(void *q);
extern void func_02091a0c(Container *c);
/* Signed divmod returns the quotient in r0 and the remainder in r1. */
extern long long func_020b3870(int a, int b);
int func_0209256c(Queue *q, void *message, int flags)
{
    int saved = OS_DisableIrq();
    if (q->capacity <= q->count) {
        int block = flags & 1;
        for (;;) {
            if (block == 0) {
                OS_RestoreIrq(saved);
                return 0;
            }
            func_02091a8c(q);
            if (q->capacity > q->count)
                break;
        }
    }
    q->buffer[(int)((unsigned long long)func_020b3870(q->first + q->count, q->capacity) >> 32)] = message;
    q->count = q->count + 1;
    func_02091a0c(&q->receive);
    OS_RestoreIrq(saved);
    return 1;
}
