typedef struct Node Node;
struct Node {
    unsigned char pad[0xc];
    void (*callback)(unsigned int *, Node *, unsigned int);
    Node *next;
    unsigned char pad14[6];
    unsigned short flags[1];
};

int func_02082494(unsigned int *out, Node *node, int index)
{
    unsigned int value;
    int result = 0;
    *out = 0;
    do {
        unsigned int flags = node->flags[index];
        if (flags & 0x100) {
            node->callback(&value, node, flags & 0xff);
            *out |= value;
            result = 1;
        }
        node = node->next;
    } while (node != 0);
    return result;
}
