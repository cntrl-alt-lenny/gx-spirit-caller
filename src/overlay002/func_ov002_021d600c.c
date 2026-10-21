typedef unsigned short u16;
typedef unsigned int u32;
typedef struct Node { u16 pair; unsigned short kind:4; unsigned short rest:12; u16 owner; u16 next; } Node;
typedef struct Slot { unsigned char pad0[0x30]; unsigned int id:13; unsigned int rest:19; u32 pad; u16 active; u16 pad2; int owner; u32 flags; } Slot;
extern unsigned char data_ov002_022cf1a6[];
extern unsigned char data_ov002_022cf16c[];
extern Node data_ov002_022d0650[];
extern int func_ov002_021b9ecc(int a, int b);
extern unsigned int func_0202b890(int id);
extern int func_ov002_021c93cc(int a, int b, int bit);
extern int func_ov002_021d5d08(int arg0, int arg1, int arg2, int arg3, u16 arg4);
void func_ov002_021d600c(int arg0, int arg1) {
    int current = *(u16 *)(data_ov002_022cf1a6 + (arg0 & 1) * 0x868 + arg1 * 20);
    Node *node;
    int next;
    int lo, hi;
    int owner;
    Slot *slot;
    if (current == 0) return;
    do {
        node = &data_ov002_022d0650[current];
        hi = (node->pair >> 8) & 255;
        next = node->next;
        lo = node->pair & 255;
        if (node->kind == 6 || node->kind == 7 || node->kind == 10) {
            slot = (Slot *)(data_ov002_022cf16c + (lo & 1) * 0x868 + hi * 20);
            if (slot->id != 0 && slot->active != 0 && !((slot->flags >> 6) & 1)) {
                owner = -1;
                switch (func_ov002_021b9ecc(lo, hi)) {
                case 0x1322: case 0x1466: case 0x169a: case 0x1877: case 0x1a9c:
                    owner = lo;
                    break;
                case 0x13ea:
                    owner = slot->owner;
                    break;
                case 0x18bf: case 0x18c0: case 0x18c1: case 0x18c2:
                    if (func_ov002_021c93cc(arg0, arg1, func_0202b890(func_ov002_021b9ecc(lo, hi))) != 0)
                        owner = node->owner & 1;
                    break;
                }
                if (owner >= 0) func_ov002_021d5d08(arg0, arg1, current, 5, (u16)owner);
            }
        }
        current = next;
    } while (next != 0);
}


