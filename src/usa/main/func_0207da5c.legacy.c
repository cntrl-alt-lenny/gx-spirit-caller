typedef struct Node {
    char pad[8];
    void *value;
    struct Node *next;
} Node;

typedef struct {
    char pad[4];
    void *value;
    Node *head;
} Anchor;

typedef struct {
    char pad0[0x1c];
    void *value;
    char pad1[4];
    Anchor anchor;
} T_0207db44;

void func_0207da5c(T_0207db44 *list) {
    Node *node;
    Anchor *anchor = &list->anchor;
    node = anchor->head;
    while (node != 0) {
        node->value = list->value;
        node = node->next;
    }
    anchor->value = list->value;
}
