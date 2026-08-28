typedef struct Node {
    int key;
    struct Node *next;
} Node;

extern int func_02097c6c(void);
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern Node *data_021a8228;

Node *func_020976cc(void) {
    int key = func_02097c6c();
    int irqState = OS_DisableIrq();
    Node *node = data_021a8228;
    while (node != 0 && node->key != key) {
        node = node->next;
    }
    OS_RestoreIrq(irqState);
    return node;
}
