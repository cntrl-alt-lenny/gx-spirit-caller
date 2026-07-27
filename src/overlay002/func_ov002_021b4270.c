/* func_ov002_021b4270: sum the f4 field of every "kind<6" node in the
 * singly-linked list at data_ov002_022d0650, starting from the u16 head
 * index stored per (player,idx) in data_ov002_022cf1a6 (0x868/player,
 * stride 20/idx -- the established Cluster-A row table indexing). Only
 * nodes whose f0 equals `val` contribute. */
typedef unsigned short u16;

struct D0650Entry {
    u16 f0;
    u16 kind : 4;
    u16 _pad2 : 12;
    u16 f4;
    u16 next;
};

extern u16 data_ov002_022cf1a6[];
extern struct D0650Entry data_ov002_022d0650[];

int func_ov002_021b4270(int player, int idx, int val) {
    int sum = 0;
    u16 head = *(u16 *)((char *)data_ov002_022cf1a6 + (player & 1) * 0x868 + idx * 20);

    if (head == 0)
        return 0;

    do {
        struct D0650Entry *e = &data_ov002_022d0650[head];
        head = e->next;
        if (e->kind < 6) {
            if (e->f0 == val)
                sum += e->f4;
        }
    } while (head != 0);

    return sum;
}
