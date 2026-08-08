/* func_020683ec: pop-front of an intrusive singly-linked list. Returns
 * the popped node (or NULL if empty); clears the tail pointer when the
 * list becomes empty and decrements the count. */

typedef struct Node020683ec Node020683ec;
struct Node020683ec {
    char _pad_20[0x20];
    Node020683ec *next;    /* +0x20 */
};

typedef struct {
    Node020683ec * volatile head;  /* +0x0 */
    Node020683ec *tail;              /* +0x4 */
    int count;                        /* +0x8 */
} List020683ec;

Node020683ec *func_020683ec(List020683ec *list) {
    Node020683ec *node = list->head;
    if (node != 0) {
        list->head = node->next;
        if (list->head == 0) {
            list->tail = 0;
        }
        list->count -= 1;
    }
    return node;
}
