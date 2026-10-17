/* func_0207c484: find the list node whose key (offset 4) equals key, in the
 * list headed at data_021a088c + 0x2270 (only once the table is populated). */
typedef struct Node Node;
struct Node {
    unsigned char _pad_00[4];
    int key;
    unsigned char _pad_08[4];
    Node *next;
};
typedef struct {
    unsigned char _pad_00[4];
    Node *first;
} Head;
typedef struct {
    unsigned char _pad_00[0x2270];
    Head *head;
    unsigned int count;
} Block;
extern Block *func_0207b538(void);

Node *func_0207c484(int key) {
    Block *b = func_0207b538();
    Node *n = 0;

    if (b->head != 0 && b->count > 0xc) {
        for (n = b->head->first; n != 0; n = n->next) {
            if (n->key == key) {
                break;
            }
        }
    }
    return n;
}
