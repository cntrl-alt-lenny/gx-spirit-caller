typedef unsigned int u32;
typedef unsigned short u16;
struct Slot { u32 id:13; u32 flag:1; u32 pad:8; u32 value:8; u32 tail:2; char gap[16]; };
struct Side { char hdr[0x30]; struct Slot slots[1]; };
typedef union { u32 bits; struct { u32 id:16; u32 index:5; u32 kind:5; u32 flags:5; u32 player:1; } b; } Packed;
typedef union { u32 bits; struct { u32 value:9; u32 player:1; u32 index:4; u32 flag:1; u32 empty:1; u32 extra:1; u32 zero:1; u32 pad:14; } b; } Command;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a2[];
extern char data_ov002_022cf1a4[];
extern unsigned int func_0202b878(int id);
extern int func_0202f9e8(int id);
extern int func_ov002_021bb068(int id);
extern int func_ov002_021c1d28(int a,int b,int c);
extern int func_ov002_021c1e20(int a,int b,int c);
extern void func_ov002_021d479c(u16 a,u16 b,u16 c,u16 d);
extern int func_ov002_021d59cc(int a,int b,int c,int d,u16 e);
extern int func_ov002_021e30b4(int a,int b,int c);
extern void func_ov002_02244fe4(int a,u32 b);
void func_ov002_021d6434(int player,int index,int active,int card,int extra) {
    int row = index * 20;
    int off = (player & 1) * 0x868;
    int id = ((struct Slot *)(data_ov002_022cf16c + off + 0x30 + row))->id;
    int noCard = card == 0;
    int empty;
    Command cmd;
    int send;
    if (func_0202b878(card) == 0x17) {
        if (func_ov002_021c1e20(player,index,extra)) return;
    } else if (func_0202b878(card) == 0x16) {
        if (func_ov002_021c1d28(player,index,extra)) return;
    }
    if (id == 0) return;
    empty = *(u16 *)(data_ov002_022cf1a4 + off + row) == 0;
    cmd.b.player = player;
    cmd.b.index = index;
    cmd.b.flag = *(u16 *)(data_ov002_022cf1a2 + off + row);
    cmd.b.empty = empty;
    cmd.b.value = ((struct Slot *)(data_ov002_022cf16c + off + 0x30 + row))->flag + (((struct Slot *)(data_ov002_022cf16c + off + 0x30 + row))->value << 1);
    cmd.b.extra = extra;
    cmd.b.zero = 0;
    if (active) active = active <= func_0202f9e8(id);
    send = 0;
    if (noCard && index < 5 && empty) send = 1;
    func_ov002_021d479c((u16)((player ? 0x8000 : 0) | 0x35), (u16)index, (u16)(*(u16 *)(data_ov002_022cf1a4 + off + row) == 0), (u16)send);
    if (index >= 5) return;
    if (empty) {
        if ((id == 0x1174 || id == 0x133b) && (noCard || active) && !func_ov002_021bb068(0x148e)) {
            func_ov002_021d59cc(player,index,0x1174,2,0);
        }
        if (active) {
*(u16 *)(data_ov002_022cf1a4 + off + row) = 1;
            func_ov002_021e30b4((((((u32)player << 31) & 0x80000000) | 0x8200000) | 0x10000000) | ((index << 16) & 0x1f0000) | (u16)id,(u16)cmd.b.value,cmd.bits);
            *(u16 *)(data_ov002_022cf1a4 + off + row) = 0;
        }
        func_ov002_02244fe4(0xc,cmd.bits);
    } else {
        func_ov002_02244fe4(9,cmd.bits);
    }
}










