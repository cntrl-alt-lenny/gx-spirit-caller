typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { u32 player:1; u32 slot:4; u32 rest:27; } Selection;
typedef struct { u32 low:8; u32 middle:8; u32 high:8; u32 rest:8; } Step;
typedef struct { Selection sel; u16 flags; unsigned char pad6[3]; unsigned char type; unsigned char padA[12]; u16 flags16; Step step; } Control;
typedef struct { u32 id:13; u32 bit:1; u32 pad:8; u32 code:8; u32 top:2; char tail[16]; } Card;
typedef struct { u32 id:9; u32 player:1; u32 slot:4; u32 flag14:1; u32 flag15:1; u32 flag16:1; u32 flag17:1; u32 type:2; u32 rest:12; } Packet;
typedef union { Packet f; u32 value; } Message;
extern Control data_ov002_022cd300;
extern Step data_ov002_022cd318;
extern struct { char pad[0x480]; int count; char gap[0x150]; int value; } data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1a2[];
extern struct { char pad[0xcec]; int index; char gap[0x1c]; int enabled; } data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern void func_ov002_021b1570(int a, int b, void *c, int n);
extern void func_ov002_02244fe4(int a, u32 b);
extern int func_ov002_021e7418(void);
int func_ov002_022768b4(int a) {
    Message m;
    switch (data_ov002_022cd300.step.low) {
    case 3:
        if (data_ov002_022ce288.count > 1) {
            data_ov002_022cd300.step.low = 8;
            return 0;
        }
        if (((Card *)(data_ov002_022cf16c + (data_ov002_022cd300.sel.player & 1) * 0x868 + 0x30))[data_ov002_022cd300.sel.slot].id == 0) return 1;
        data_ov002_022cd300.step.middle = 0;
        data_ov002_022cd300.step.high = 0;
        data_ov002_022cd318.low++;
        if (data_ov002_022d016c.enabled != 0 && data_ov002_022cd744[data_ov002_022d016c.index] == 2) {
            func_ov002_021b1570(0x16, -1, &data_ov002_022cd300, 0x1c);
            data_ov002_022cd300.flags16 &= ~1;
            data_ov002_022cd300.flags16 &= ~0x40;
            return 0;
        }
    case 4:
        data_ov002_022ce288.value = 0;
        m.f.player = data_ov002_022cd300.sel.player;
        m.f.slot = data_ov002_022cd300.sel.slot;
        m.f.id = (((Card *)(data_ov002_022cf16c + (m.f.player & 1) * 0x868 + 0x30))[m.f.slot].code * 2) + ((Card *)(data_ov002_022cf16c + (m.f.player & 1) * 0x868 + 0x30))[m.f.slot].bit;
        m.f.flag15 = *(u16 *)(data_ov002_022cf1a4 + (m.f.player & 1) * 0x868 + m.f.slot * 0x14) & 1;
        m.f.flag14 = *(u16 *)(data_ov002_022cf1a2 + (m.f.player & 1) * 0x868 + m.f.slot * 0x14) & 1;
        m.f.flag16 = (data_ov002_022cd300.flags & 0x10) > 0;
        m.f.flag17 = (data_ov002_022cd300.flags & 1) > 0;
        m.f.type = data_ov002_022cd300.type;
        func_ov002_02244fe4((u16)a, m.value);
        data_ov002_022cd300.step.low = 7;
    case 7:
        if (func_ov002_021e7418() == 0) data_ov002_022cd300.step.low = 8;
        return 0;
    }
    return 1;
}




