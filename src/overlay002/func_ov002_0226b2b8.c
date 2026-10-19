typedef unsigned int u32;
typedef struct { u32 id:13; u32 side:1; u32 pad:8; u32 index:8; u32 rest:2; } Slot;
typedef struct { char pad[0x120]; Slot slots[5]; char tail[0x734]; } Row;
extern Row data_ov002_022cf16c[];
extern char data_ov002_022d016c[];
extern char data_ov002_022d0e6c[];
extern unsigned int func_0202b878(int id);
extern int func_0202e234(int x);
extern int func_ov002_021b3fd8(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_021ca5bc(int arg0);
int func_ov002_0226b2b8(int player, int kind, int slot) {
    Slot *p;
    int offset;
    int f1, f4, f8, f16, f32, id;
    unsigned short flags;
    if (player == *(int *)(data_ov002_022d016c + 0xd94) && kind == 0xb) {
        offset = (player & 1) * 0x868;
        p = (Slot *)(offset + (u32)data_ov002_022cf16c + 0x120);
        flags = *(unsigned short *)(data_ov002_022d0e6c + 0xa2);
        f1 = flags & 1;
        f4 = flags & 4;
        f8 = flags & 8;
        f16 = flags & 16;
        f32 = flags & 32;
        id = p[slot].id;
        if (f1 && func_0202e234(id) == 0) return 0;
        if (f8 && func_0202b878(id) != 0x16) return 0;
        if (f4 && func_0202b878(id) != 0x17) return 0;
        if (func_ov002_021b3fd8(player, 0xb, 0x12a1, p[slot].index * 2 + p[slot].side)) return 0;
        if (f16 && f32) {
            if (func_ov002_021ca5bc(p[slot].index * 2 + p[slot].side) == 0) return 0;
        }
        return 0x800;
    }
    return 0;
}




