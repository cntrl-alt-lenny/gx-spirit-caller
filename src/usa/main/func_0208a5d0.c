extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern void *func_0207cef4(void *list, void *cur);
extern void func_0207cf0c(void *list, void *node);
extern void func_0208a59c(void *node);

typedef struct {
    char _pad[8];
    int  f_8;
} Node0208a6b8;

void func_0208a5d0(void *list, int target) {
    Node0208a6b8 *next;
    Node0208a6b8 *node;
    int irq;

    irq = OS_DisableIrq();

    node = func_0207cef4(list, 0);
    while (node != 0) {
        next = func_0207cef4(list, node);
        if (node->f_8 == target) {
            func_0207cf0c(list, node);
            func_0208a59c(node);
        }
        node = next;
    }

    OS_RestoreIrq(irq);
}
