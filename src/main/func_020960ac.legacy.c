extern int func_020952e4(void);
extern int func_020952d0(void);
extern void func_020928e8(void *node, int size);

typedef struct Obj Obj;
typedef struct Node {
    Obj *owner;
    struct Node *next;
} Node;
struct Obj {
    unsigned char pad[0x18];
    Node *head;
};
typedef struct {
    unsigned char pad[0x18];
    Node nodes[4];
} Container;

void func_020960ac(Container *obj) {
    int i;
    Node *node;
    func_020952e4();
    for (i = 0; i < 4; i++) {
        Obj *owner = obj->nodes[i].owner;
        if (owner != 0) {
            node = owner->head;
            if (&obj->nodes[i] == node) {
                owner->head = obj->nodes[i].next;
                func_020928e8(owner, 0x3c);
            } else {
                while (node != 0) {
                    if (&obj->nodes[i] == node->next) break;
                    node = node->next;
                }
                node->next = obj->nodes[i].next;
                func_020928e8(node, 8);
            }
        }
    }
    func_020952d0();
}
