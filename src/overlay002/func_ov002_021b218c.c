typedef struct Node {
    unsigned short field0;         /* +0x0 */
    unsigned short packed : 4;     /* +0x2, low nibble compared here */
    unsigned short packed_hi : 12; /* +0x2, unused by this function */
    unsigned short field4;         /* +0x4, unused by this function */
    unsigned short next;           /* +0x6 */
} Node;

extern Node data_ov002_022d0650[];
extern void func_ov002_021b1d84(int idx);

void func_ov002_021b218c(int idx, int arg1, int arg2, int arg3)
{
    Node *node;
    int next;

    if (idx == 0)
        return;
    do {
        node = &data_ov002_022d0650[idx];
        next = node->next;
        if (node->packed == arg2 && node->field0 == arg1) {
            func_ov002_021b1d84(idx);
            if (arg3 == 0)
                return;
        }
        idx = next;
    } while (next != 0);
}
