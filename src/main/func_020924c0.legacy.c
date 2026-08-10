/* func_020924c0: OS_ReceiveMessage-style ring-buffer pop. If empty and
 * non-blocking, bail with 0. If empty and blocking, sleep on the thread
 * queue at q+8 until a message arrives. Otherwise (or once available),
 * hand back q->f_10[q->f_18] via out, advance f_18 with wraparound via
 * func_020b3870's remainder half (documented quotient/remainder divmod
 * helper -- quotient in r0, remainder in r1/high word), decrement the
 * count, notify via func_02091a0c, and return 1.
 */

typedef struct {
    char _pad0[0x10];
    void **f_10;
    int f_14;
    int f_18;
    int f_1c;
} queue_t;

extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern void func_02091a8c(void *threadQueue);
extern long long func_020b3870(int a, int b);
extern void func_02091a0c(queue_t *q);

int func_020924c0(queue_t *q, void **out, int flags) {
    int saved = OS_DisableIrq();
    if (q->f_1c == 0) {
        int block = flags & 1;
        void *tq = (char *)q + 8;
        for (;;) {
            if (block == 0) {
                OS_RestoreIrq(saved);
                return 0;
            }
            func_02091a8c(tq);
            if (q->f_1c != 0) {
                break;
            }
        }
    }
    if (out != 0) {
        *out = q->f_10[q->f_18];
    }
    q->f_18 = (int)((unsigned long long)func_020b3870(q->f_18 + 1, q->f_14) >> 32);
    q->f_1c = q->f_1c - 1;
    func_02091a0c(q);
    OS_RestoreIrq(saved);
    return 1;
}
