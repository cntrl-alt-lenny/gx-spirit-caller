typedef struct Node_0200fbd4 Node_0200fbd4;
struct Node_0200fbd4 {
    Node_0200fbd4 *next;
    int f4;
    int f8;
    unsigned int skip_bit0 : 1;
    unsigned int skip_bit1 : 1;
    unsigned int skip : 1;
    unsigned int rest : 29;
};

typedef struct {
    signed char type;
    char pad[7];
    int f8;
} Query_0200fbd4;

typedef struct {
    char pad[0x1900];
    Node_0200fbd4 *buckets[3];
    Node_0200fbd4 *list;
    unsigned int pad1910;
    unsigned int count;
} Table_0200fbd4;

extern Table_0200fbd4 data_0218cbc8;

Node_0200fbd4 *func_0200fbd4(Query_0200fbd4 *q) {
    Table_0200fbd4 *t = &data_0218cbc8;
    Node_0200fbd4 *n;
    unsigned int i;

    if (q->type == 5) {
        for (n = t->list; n != 0; n = n->next) {
            if (n->f8 == q->f8) {
                return n;
            }
        }
    } else {
        for (i = 0; i < t->count; i++) {
            for (n = t->buckets[i]; n != 0; n = n->next) {
                if (n->f8 == q->f8) {
                    return n;
                }
            }
        }
    }
    return 0;
}
