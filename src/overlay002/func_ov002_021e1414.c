typedef unsigned int u32;
typedef unsigned short u16;
struct Slot { u16 id:13; u16 rest:3; u16 other; };
union Event { u32 value; struct { u32 slot:9; u32 player:1; u32 flag:1; u32 flip:1; u32 kind:4; u32 rest:16; } b; };
union Command { u32 value; struct { u32 player:1; u32 kind:5; u32 slot:10; u32 rest:16; } b; };
union Card { u32 value; struct { u32 id:16; u32 code:15; u32 player:1; } b; };
extern struct Slot data_ov002_022d0250[];
extern unsigned int func_0202b878(int id);
extern int func_0202e2c8(int unused0);
extern int func_ov002_021baca8(int a0,int a1,int a2);
extern void func_ov002_021d479c(u16 a0,u16 a1,u16 a2,u16 a3);
extern void func_ov002_021df62c(int arg0,int arg1,int idx);
extern void func_ov002_021e276c(void *self,int a,int b,int c);
extern void func_ov002_021e2d94(int a,int b,int c,int d);
extern int func_ov002_021e30b4(int a,int b,int c);
extern void func_ov002_02244fe4(int a,u32 b);
void func_ov002_021e1414(int arg0,int idx,int arg2) {
    int player;
    int id;
    id = data_ov002_022d0250[idx].id;
    player = idx & 1;
    union Event event;

    int kind = func_0202e2c8(id) ? 12 : 13;
    event.b.flip = arg0 ^ arg2;
    event.b.player = arg0;
    event.b.kind = 14;
    event.b.slot = idx;
    event.b.flag = 0;

    func_ov002_021d479c(0x3f, (u16)((arg0 & 1) | ((kind & 31) << 1) | ((idx & 1023) << 6)), (player & 1) | 0x5c, arg2 ? 1 : 0);
    switch (id) {
    case 0x14a5:
        func_ov002_021df62c(player,14,idx);
    case 0x16f9:
        func_ov002_021e276c(player,(u16)id,1,(u16)idx);
        break;
    case 0x106d: case 0x1653: case 0x1655:
        if (!arg2) break;
    case 0x1185: case 0x12a2: case 0x1309: case 0x13e3: case 0x1687: case 0x16f5: case 0x17c5: case 0x19fe:
        func_ov002_021e30b4(((player << 31) & 0x80000000) | 0x4e0000 | 0x38000000 | (u16)id,(u16)idx,event.value);
        break;
    }
    if (func_0202b878(id) == 9) {
        int i;
        for (i=0;i<=4;i++) {
            if (func_ov002_021baca8(player,i,0x1a8d)) func_ov002_021e2d94(player,i,5,1);
        }
    }
    func_ov002_02244fe4(0x1c,event.value);
}




