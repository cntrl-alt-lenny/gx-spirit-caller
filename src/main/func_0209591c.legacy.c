typedef struct Node {
    struct Node *next;
} Node;

extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern int func_02095cc8(void);
extern void func_02093814(int ms);

extern int data_021a6750;
extern int data_021a6760;
extern Node *data_021a6770[];
extern Node *data_021a675c;
extern int data_021a6768;
extern Node *data_021a674c;

Node *func_0209591c(int arg)
{
    int saved;
    int v;
    Node *node;
    Node *tail;
    int idx;

    saved = OS_DisableIrq();

    if (arg & 1) {
        v = func_02095cc8();
        if (data_021a6750 == v) {
            do {
                OS_RestoreIrq(saved);
                func_02093814(100);
                saved = OS_DisableIrq();
                v = func_02095cc8();
            } while (data_021a6750 == v);
        }
    } else {
        v = func_02095cc8();
        if (data_021a6750 == v) {
            OS_RestoreIrq(saved);
            return 0;
        }
    }

    idx = data_021a6760;
    node = data_021a6770[idx];
    data_021a6760 = idx + 1;
    if (idx + 1 > 8)
        data_021a6760 = 0;

    tail = node;
    while (tail->next != 0)
        tail = tail->next;

    if (data_021a675c != 0)
        data_021a675c->next = node;
    else
        data_021a674c = node;
    data_021a675c = tail;
    data_021a6768 -= 1;
    data_021a6750 += 1;

    OS_RestoreIrq(saved);
    return node;
}
