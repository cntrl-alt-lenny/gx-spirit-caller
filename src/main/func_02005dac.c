typedef struct {
    int f0;
    int f4;
    short next;
    short f0a;
} Node;
typedef struct {
    char out[0x400];
    Node nodes[128];
    unsigned short head;
} Pool;
extern Pool *data_02103d6c[];
extern void func_02005d54(int idx, int slot_i, int sel);

Node *func_02005dac(int which, int slot_i) {
    int index;
    unsigned short *head;
    Node *nodes;
    Node *result;
    Pool *p;
    switch (which) {
    case 1: p = data_02103d6c[0]; break;
    case 2: p = data_02103d6c[1]; break;
    default: p = 0; break;
    }
    if (p->head < 128) {
        func_02005d54(p->head, slot_i, which);
        return &p->nodes[p->head++];
    }
    return 0;
}











