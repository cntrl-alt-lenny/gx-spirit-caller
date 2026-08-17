extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern void *func_0207cfdc(void *list, void *cur);
extern void func_0207cff4(void *list, void *node);
extern void func_0208a684(void *node);

typedef struct {
    char _pad[8];
    int  f_8;
} Node0208a6b8;

void func_0208a6b8(void *list, int target) {
    Node0208a6b8 *next;
    Node0208a6b8 *node;
    int irq;

    irq = OS_DisableIrq();

    node = func_0207cfdc(list, 0);
    while (node != 0) {
        next = func_0207cfdc(list, node);
        if (node->f_8 == target) {
            func_0207cff4(list, node);
            func_0208a684(node);
        }
        node = next;
    }

    OS_RestoreIrq(irq);
}
