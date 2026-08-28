/* func_02095f6c: walks the linked list at obj->f_18, clearing each
 * node's first two fields and handing it to func_02092800(node, 8)
 * before advancing (next is saved before the node is cleared).
 */
extern int func_020951f0(void);
extern int func_020951dc(void);
extern void func_02092800(void *node, int type);

typedef struct func_02096060_Node {
    int f_0;
    struct func_02096060_Node *next;
} func_02096060_Node;

typedef struct {
    unsigned char pad[0x18];
    func_02096060_Node *head;
} func_02096060_Obj;

void func_02095f6c(func_02096060_Obj *obj) {
    func_02096060_Node *node;

    func_020951f0();
    node = obj->head;

    if (node != 0) {
        do {
            func_02096060_Node *next = node->next;
            node->f_0 = 0;
            node->next = 0;
            func_02092800(node, 8);
            node = next;
        } while (node != 0);
    }

    func_020951dc();
}
