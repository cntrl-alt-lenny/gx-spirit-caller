/* func_0207c5b4: allocate the first free 0xd0-byte slot of the table at
 * data_021a088c + 0x2270 and append it to the list; NULL when the table is
 * missing or too small, the last slot when none is free. */
typedef struct Entry Entry;
struct Entry {
    unsigned char used;
    unsigned char _pad_01[3];
    unsigned int index;
    Entry *prev;
    Entry *next;
    unsigned char _pad_10[0xd0 - 0x10];
};
typedef struct {
    unsigned int count;
    Entry *first;
    Entry *last;
    Entry slots[1];
} Head;
typedef struct {
    unsigned char _pad_00[0x2270];
    Head *head;
    unsigned int size;
} Block;
extern Block *func_0207b538(void);

Entry *func_0207c5b4(void) {
    Block *b = func_0207b538();
    Head *h = b->head;
    unsigned int n;
    int i;
    Entry *e;

    e = 0;
    if (h == 0) {
        return 0;
    }
    if (b->size <= 0xc) {
        return 0;
    }
    n = (b->size - 0xc) / 0xd0;
    if (n == 0) {
        return 0;
    }
    if (n <= h->count) {
        return 0;
    }
    for (i = 0; i < n; i++) {
        e = (Entry *)((char *)h + 0xc + i * sizeof(Entry));
        if (e->used == 0) {
            break;
        }
    }
    if (i >= n) {
        return e;
    }
    e->used = 1;
    e->index = h->count;
    e->next = 0;
    e->prev = h->last;
    h->last = e;
    if (e->prev != 0) {
        e->prev->next = e;
    } else {
        h->first = e;
    }
    h->count++;
    return e;
}
