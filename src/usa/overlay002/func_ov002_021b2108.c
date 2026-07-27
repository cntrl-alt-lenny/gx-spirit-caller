/* func_ov002_021b2108: linked-list scan + conditional callback. */

typedef struct Node {
    unsigned short field0;
    unsigned short packed;
    unsigned short field4;
    unsigned short next;
} Node;

extern Node data_ov002_022d0570[];
extern void func_ov002_021b1ca4(int idx);

void func_ov002_021b2108(int idx, int arg1, int arg2, int arg3)
{
    Node *node;
    int next;

    if (idx == 0)
        return;
    do {
        node = &data_ov002_022d0570[idx];
        next = node->next;
        if (node->field4 == arg2 && node->field0 == arg1) {
            func_ov002_021b1ca4(idx);
            if (arg3 == 0)
                return;
        }
        idx = next;
    } while (next != 0);
}
