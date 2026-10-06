typedef struct Node_0200fd1c Node_0200fd1c;
struct Node_0200fd1c {
    Node_0200fd1c *next;
    int f4;
    int f8;
    unsigned int skip_bit0 : 1;
    unsigned int skip_bit1 : 1;
    unsigned int skip : 1;
    unsigned int mid : 9;
    unsigned int key : 20;
};

typedef struct {
    int f0;
    int f4;
    int f8;
} Query_0200fd1c;

typedef struct {
    char pad[0x910];
    Node_0200fd1c *head;
} Table_0200fd1c;

extern Table_0200fd1c data_0218dbc8;

Node_0200fd1c *func_0200fd1c(Query_0200fd1c *q) {
    Node_0200fd1c *n;
    int s;

    for (n = data_0218dbc8.head; n != 0; n = n->next) {
        s = n->skip;
        if (s == 0) {
            if (n->f8 == q->f0) {
                return n;
            }
            if (s != 0) {
                if (q->f8 == n->key) {
                    return n;
                }
            }
        }
    }
    return 0;
}
