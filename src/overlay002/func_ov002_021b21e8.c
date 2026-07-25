/* func_ov002_021b21e8: linked-list scan + conditional callback. */

typedef struct Node {
    unsigned short field0;
    unsigned short packed;
    unsigned short field4;
    unsigned short next;
} Node;

extern Node data_ov002_022d0650[];
extern void func_ov002_021b1d84(int idx);

void func_ov002_021b21e8(int idx, int arg1, int arg2, int arg3)
{
    Node *node;
    int next;

    if (idx == 0)
        return;
    do {
        node = &data_ov002_022d0650[idx];
        next = node->next;
        if (node->field4 == arg2 && node->field0 == arg1) {
            func_ov002_021b1d84(idx);
            if (arg3 == 0)
                return;
        }
        idx = next;
    } while (next != 0);
}
