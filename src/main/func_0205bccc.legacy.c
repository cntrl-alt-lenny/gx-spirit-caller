typedef struct Node Node;
struct Node {
    int mode;
    int field_4;
    int active;
    char pad_0c[0x14];
    Node *next;
};
typedef struct {
    char pad_00[0x424];
    Node *head;
} Owner;

int func_0205bccc(Owner **pp) {
    Node *n = (*pp)->head;
    while (n != 0) {
        if (n->active != 0 && n->mode != 3) {
            return 1;
        }
        n = n->next;
    }
    return 0;
}
