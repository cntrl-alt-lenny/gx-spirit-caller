/* func_ov002_021b4274: walk the index-linked list rooted at self->head
 * (0 terminates) through the shared 8-byte-stride node table
 * data_ov002_022d0570, calling the callback on each node until it returns
 * non-zero; return that node, or 0 if the list is exhausted. */
struct Ov002Node0650 { char _pad[6]; unsigned short next; };
extern struct Ov002Node0650 data_ov002_022d0570[];

struct S021b4354 { char _pad[10]; unsigned short head; };

void *func_ov002_021b4274(struct S021b4354 *self, int (*cb)(struct Ov002Node0650 *, void *), void *extra) {
    unsigned short idx = self->head;
    struct Ov002Node0650 *node;
    if (idx == 0) goto ret0;
    do {
        node = &data_ov002_022d0570[idx];
        idx = node->next;
        if (cb(node, extra)) return node;
    } while (idx != 0);
ret0:
    return 0;
}
