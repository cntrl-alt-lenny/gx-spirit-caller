typedef struct node_0205c7f4 Node;
struct node_0205c7f4 {
    int status;
    char _pad4[8];
    int id;
    char _pad10[0x2c];
    Node *next;
};
typedef struct {
    char _pad0[0x434];
    Node *head;
} Registry;

Node *func_0205c7f4(Registry **self, int id) {
    Node *node = (*self)->head;
    while (node != 0) {
        if (node->id == id) {
            if (node->status == 0x69) {
                return node;
            }
        }
        node = node->next;
    }
    return 0;
}
