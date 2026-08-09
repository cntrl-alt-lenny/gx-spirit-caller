/* func_02096060: walks the linked list at obj->f_18, clearing each
 * node's first two fields and handing it to func_020928e8(node, 8)
 * before advancing (next is saved before the node is cleared).
 */
extern int func_020952e4(void);
extern int func_020952d0(void);
extern void func_020928e8(void *node, int type);

typedef struct func_02096060_Node {
    int f_0;
    struct func_02096060_Node *next;
} func_02096060_Node;

typedef struct {
    unsigned char pad[0x18];
    func_02096060_Node *head;
} func_02096060_Obj;

void func_02096060(func_02096060_Obj *obj) {
    func_02096060_Node *node;

    func_020952e4();
    node = obj->head;

    if (node != 0) {
        do {
            func_02096060_Node *next = node->next;
            node->f_0 = 0;
            node->next = 0;
            func_020928e8(node, 8);
            node = next;
        } while (node != 0);
    }

    func_020952d0();
}
