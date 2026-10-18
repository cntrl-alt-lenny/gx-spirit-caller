typedef unsigned int u32;
typedef unsigned short u16;
struct State {
    u32 player:1;
    u32 slot:4;
    u32 active:1;
    u32 mode:2;
    u32 card:15;
    u32 key:9;
    u16 flags;
    u16 id;
    unsigned char count;
    unsigned char count2;
    char pad[12];
    u16 low:8;
    u16 state:3;
    u16 high:5;
};
struct Entry { u16 id:13; u16 rest:3; u16 other; };
extern struct State data_ov002_022cd300;
extern struct Entry data_ov002_022d0250[];
extern int func_ov002_021b9aa8(u32 a, u32 b);
extern void func_ov002_02254a2c(int a);
extern void func_ov002_0227a8fc(void);
void func_ov002_0227adcc(int a, int b, int c, int d, int e)
{
    u32 id;
    if (c < 0) return;
    data_ov002_022cd300.player = a;
    data_ov002_022cd300.slot = c;
    data_ov002_022cd300.active = 1;
    data_ov002_022cd300.mode = d;
    if (e == 0) {
        data_ov002_022cd300.count2 = 0;
        data_ov002_022cd300.count = 0;
    }
    data_ov002_022cd300.key = b;
    data_ov002_022cd300.card = data_ov002_022d0250[b].id;
    data_ov002_022cd300.state = 4;
    id = data_ov002_022cd300.card;
    data_ov002_022cd300.id = id;
    data_ov002_022cd300.flags = 4;
    data_ov002_022cd300.flags |= 1;
    if (id == 0x1578 || id == 0x1a92)
        data_ov002_022cd300.flags |= 0x10;
    if (func_ov002_021b9aa8(a, b) >= 0)
        func_ov002_02254a2c(a);
    func_ov002_0227a8fc();
}






