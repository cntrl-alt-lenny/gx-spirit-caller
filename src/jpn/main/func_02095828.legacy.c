typedef struct Node {
    struct Node *next;
} Node;

extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern int func_02095bd4(void);
extern void func_02093720(int ms);

extern int data_021a6670;
extern int data_021a6680;
extern Node *data_021a6690[];
extern Node *data_021a667c;
extern int data_021a6688;
extern Node *data_021a666c;

Node *func_02095828(int arg)
{
    int saved;
    int v;
    Node *node;
    Node *tail;
    int idx;

    saved = OS_DisableIrq();

    if (arg & 1) {
        v = func_02095bd4();
        if (data_021a6670 == v) {
            do {
                OS_RestoreIrq(saved);
                func_02093720(100);
                saved = OS_DisableIrq();
                v = func_02095bd4();
            } while (data_021a6670 == v);
        }
    } else {
        v = func_02095bd4();
        if (data_021a6670 == v) {
            OS_RestoreIrq(saved);
            return 0;
        }
    }

    idx = data_021a6680;
    node = data_021a6690[idx];
    data_021a6680 = idx + 1;
    if (idx + 1 > 8)
        data_021a6680 = 0;

    tail = node;
    while (tail->next != 0)
        tail = tail->next;

    if (data_021a667c != 0)
        data_021a667c->next = node;
    else
        data_021a666c = node;
    data_021a667c = tail;
    data_021a6688 -= 1;
    data_021a6670 += 1;

    OS_RestoreIrq(saved);
    return node;
}
