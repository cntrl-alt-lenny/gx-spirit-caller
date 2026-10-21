typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
struct Ov002Self { u16 f0; u16 b0:1; u16 slot:5; u16 rest:10; u16 p4:4; u16 flag:1; u16 rest4:11; };
struct node;
struct Node;
struct State { char pad[0x5a8]; int state; };
struct Row { u32 id:13; u32 bit:1; u32 pad:8; u32 field:8; u32 rest:2; char tail[16]; };
struct Side { char prefix[0x30]; struct Row row[1]; };
extern struct State data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern unsigned int func_0202b878(int id);
extern int func_ov002_021d63fc(struct Ov002Self *self, int arg1, int arg2, int arg3);
extern int func_ov002_021de4d8(struct Ov002Self *self, int player, int idx);
extern int func_ov002_021de9d4(int a, int b, int c);
extern void func_ov002_021df62c(int arg0, int arg1, int idx);
extern int func_ov002_021df708(int arg0, int arg1);
extern int func_ov002_021e286c(int arg0);
extern int func_ov002_021e2b1c(int arg0);
extern int func_ov002_021e358c(int arg0, int arg1);
extern int func_ov002_021fd668(int player, int slot, int id);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
int func_ov002_02220c14(struct Ov002Self *self) {
    int offset;
    int player;
    int slot;
    int id;
    int index;
    int result;
    struct Row *row;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (func_ov002_0223df38((struct Node *)self, 0, 0)) {
            result = func_ov002_0223de94((struct node *)self, 0);
            player = (u8)result;
            slot = (u8)((u16)result >> 8);
            offset = (player & 1) * 0x868;
            index = (short)slot * 20;
            id = ((struct Side *)((unsigned)data_ov002_022cf16c + offset))->row[(short)slot].id;
            if (id != 0 && *(u16 *)(data_ov002_022cf1a4 + offset + index) == 0) {
                func_ov002_021d63fc(self, player, slot, 0);
                func_ov002_021df708(player, id);
                func_ov002_021e2b1c(30);
                if (func_0202b878(id) == 23 && self->flag == 0) {
                    if (func_ov002_021fd668(player, slot, id)) {
                        row = (struct Row *)(data_ov002_022cf16c + offset + 0x30);
                        func_ov002_021df62c(player, slot, ((struct Row *)((char *)row + index))->field * 2 + ((struct Row *)((char *)row + index))->bit);
                        func_ov002_021e358c(((player << 31) & 0x80000000) | 0x44000000 | ((slot << 16) & 0x1f0000) | (u16)id,
                            (u16)(((struct Row *)((char *)row + index))->field * 2 + ((struct Row *)((char *)row + index))->bit));
                    } else return 0x7f;
                } else {
                    func_ov002_021d63fc(self, player, slot, 0);
                }
            }
        }
        return 0x64;
    case 0x7f:
        result = func_ov002_0223de94((struct node *)self, 0);
        func_ov002_021de4d8(self, (u8)result, (u8)((u16)result >> 8));
        return 0x64;
    case 0x64:
        row = (struct Row *)(data_ov002_022cf16c + (self->b0 & 1) * 0x868 + 0x30);
        id = row[self->slot].id;
        if (id) {
            id = row[self->slot].bit;
            func_ov002_021de9d4((int)self, self->b0, self->slot);
            func_ov002_021e286c(id);
        }
        return 0;
    default: return 0;
    }
}







