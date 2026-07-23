typedef struct Node0200fdc0 {
    struct Node0200fdc0 *next;
    char pad[0x8];
    unsigned int fieldc;
} Node0200fdc0;

typedef struct {
    char pad[0x910];
    Node0200fdc0 *head;
} Data0218dbc8;

typedef struct {
    char pad[0x8];
    int field8;
} Arg0200fdc0;

extern Data0218dbc8 data_0218dbc8;

Node0200fdc0 *func_0200fdc0(Arg0200fdc0 *arg0) {
    Node0200fdc0 *n = data_0218dbc8.head;
    int key;
    if (n == 0) {
        goto notfound;
    }
    key = arg0->field8;
    do {
        if (key == (int)(n->fieldc >> 12)) {
            return n;
        }
        n = n->next;
    } while (n != 0);
notfound:
    return 0;
}
