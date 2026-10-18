typedef unsigned short u16;
typedef unsigned int u32;

typedef struct Node {
    u16 pad[3];
    u16 next;
} Node;

extern u16 data_ov002_022cf1a6[];
extern Node data_ov002_022d0650[];

Node *func_ov002_021b42e4(u32 a, u32 b, int (*cb)(Node *, u32), u32 arg) {
    u16 idx = *(u16 *)((char *)data_ov002_022cf1a6 + (a & 1) * 0x868 + b * 0x14);
    Node *n;
    while (idx != 0) {
        n = &data_ov002_022d0650[idx];
        idx = n->next;
        if (cb(n, arg) != 0) {
            return n;
        }
    }
    return 0;
}
