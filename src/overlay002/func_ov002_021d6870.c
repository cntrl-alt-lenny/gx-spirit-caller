typedef unsigned int u32;
typedef unsigned short u16;
struct Slot { u32 id:13; u32 flag:1; u32 pad:8; u32 value:8; u32 tail:2; };
struct Payload { u32 value:9; u32 player:1; u32 index:4; u32 empty:1; u32 change:1; u32 other:1; u32 zero:1; u32 rest:14; };
union PayloadWord { struct Payload b; u32 bits; };
struct Node { u16 id; u16 kind:4; u16 pad:12; u16 owner; u16 next; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a2[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1a6[];
extern struct Node data_ov002_022d0650[];
extern int func_ov002_021b9ecc(int a, int b);
extern int func_0202f9e8(int a);
extern int func_ov002_021bb068(int id);
extern void func_ov002_021d479c(u16 a, u16 b, u16 c, u16 d);
extern int func_ov002_021d59cc(int a, int b, int c, int d, u16 e);
extern void func_ov002_021d5b80(int a, int b, int c, int d);
extern void func_ov002_021e276c(void *self, int a, int b, int c);
extern void func_ov002_021e2d94(int a, int b, int c, int d);

extern int func_ov002_021e30b4(int a, int b, int c);
extern void func_ov002_02244fe4(int a, u32 b);
int func_ov002_021d6870(int player, int idx, int active, int limit, int self, int other) {
    int id = func_ov002_021b9ecc(player, idx);
    int off, roff, old, empty, raw;
    union PayloadWord payload;
    if (idx >= 5) return 0;
    if (id != 0) {
        roff = idx * 20;
        off = (player & 1) * 0x868;
        raw = *(u16 *)(data_ov002_022cf1a2 + off + roff);
        old = *(u16 *)(data_ov002_022cf1a4 + off + roff);
        empty = raw == 0;
        payload.b.player = player;
        payload.b.index = idx;
        payload.b.empty = empty;
        payload.b.change = old ^ active;
        payload.b.value = ((struct Slot *)(data_ov002_022cf16c + off + 0x30 + roff))->value * 2 + ((struct Slot *)(data_ov002_022cf16c + off + 0x30 + roff))->flag;
        payload.b.other = other;
        payload.b.zero = 0;
        if (limit != 0) limit = limit <= func_0202f9e8(id);
        func_ov002_021d479c((player ? 0x8000 : 0) | 0x34, idx, active, self == 0);
        if (self == 0) func_ov002_021e2d94(player, idx, 0x15, 1);
        if ((active == 0 && old != 0) || (active != 0 && old == 0)) {
            if (!empty) {
                if (id == 0x1005)
                    func_ov002_021e30b4(((((u32)player << 31) & 0x80000000) | 0x6200000) | 0x10000000 | ((idx << 16) & 0x1f0000) | (u16)id, (u16)payload.b.value, payload.bits);
            } else {
                switch (id) {
                case 0x101e: case 0x1048: case 0x1197: case 0x1868:
                    func_ov002_021e30b4(((((u32)player << 31) & 0x80000000) | 0x6200000) | 0x10000000 | ((idx << 16) & 0x1f0000) | (u16)id, (u16)payload.b.value, payload.bits);
                    break;
                }
            }
        }
        if (limit && active != 0 && old == 0 && func_0202f9e8(id) != 0) {
            if ((id == 0x1174 || id == 0x133b) && func_ov002_021bb068(0x148e) == 0)
                func_ov002_021d59cc(player, idx, 0x1174, 2, 0);
            *(u16 *)(data_ov002_022cf1a4 + off + roff) = 1;
            func_ov002_021e30b4(((((u32)player << 31) & 0x80000000) | 0x6200000) | 0x10000000 | ((idx << 16) & 0x1f0000) | (u16)id, (u16)payload.b.value, payload.bits);
            *(u16 *)(data_ov002_022cf1a4 + off + roff) = 0;
        }
        if (empty) {
            int current = *(u16 *)(data_ov002_022cf1a6 + off + roff);
            if (current != 0) {
                do {
                    struct Node *node = &data_ov002_022d0650[current];
                    current = node->next;
                    if (node->kind < 6 && node->id == 0x1a0b)
                        func_ov002_021e276c((void *)(u32)node->owner, 0x1a0b, 1, 0);
                } while (current != 0);
            }
            func_ov002_021d5b80(player, idx, 0x1a0b, 1);
        }
        if (active != 0 && old != 0) func_ov002_02244fe4(9, payload.bits);
        else func_ov002_02244fe4(11, payload.bits);
        return 1;
    }
    return 0;
}





