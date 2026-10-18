typedef unsigned short u16;

typedef struct {
    u16 pad0;
    u16 kind : 4;
    u16 rest : 12;
    u16 pad4;
    u16 next;
} Node;

extern u16 data_ov002_022d0252[][2];
extern Node data_ov002_022d0650[];
extern void func_ov002_021b1d84(int id);

void func_ov002_021b27a4(int idx)
{
    int id = data_ov002_022d0252[idx][0];
    int next;
    if (id == 0) {
        return;
    }
    do {
        Node *n = &data_ov002_022d0650[id];
        next = n->next;
        if (n->kind == 3) {
            func_ov002_021b1d84(id);
        }
        id = next;
    } while (next != 0);
}
