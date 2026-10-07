typedef struct Node_0200fc78 Node_0200fc78;
struct Node_0200fc78 {
    Node_0200fc78 *next;
    int f4;
    int f8;
    unsigned int key;
};

typedef struct {
    signed char type;
    char pad[0x17];
    int f18;
} Query_0200fc78;

typedef struct {
    char pad[0x1900];
    Node_0200fc78 *buckets[3];
    Node_0200fc78 *list;
    unsigned int pad1910;
    unsigned int count;
} Table_0200fc78;

extern Table_0200fc78 data_0218cbc8;

Node_0200fc78 *func_0200fc78(Query_0200fc78 *q) {
    Table_0200fc78 *t = &data_0218cbc8;
    Node_0200fc78 *n;
    unsigned int i;

    if (q->type == 5) {
        for (n = t->list; n != 0; n = n->next) {
            if (q->f18 == (n->key >> 12)) {
                return n;
            }
        }
    } else {
        for (i = 0; i < t->count; i++) {
            for (n = t->buckets[i]; n != 0; n = n->next) {
                if (q->f18 == (n->key >> 12)) {
                    return n;
                }
            }
        }
    }
    return 0;
}
