typedef unsigned int u32;
typedef struct { u32 id:13; u32 rest:19; u32 pad[4]; } Slot;
typedef struct { char pad[0x30]; Slot slots[5]; char tail[0x7d4]; } Side;
extern Side data_ov002_022cf16c[2];
extern struct { char pad[0xd28]; u32 idx; } data_ov002_022d016c;
extern int func_ov002_021b3ecc(int arg0, int arg1, int arg2);
extern int func_ov002_021de480(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_021d5b80(int arg0, int arg1, int arg2, int arg3);
int func_ov002_02263f04(u32 self, int arg) {
    while (data_ov002_022d016c.idx < 10) {
        u32 i = data_ov002_022d016c.idx;
        int player;
        int slot;
        player = self ^ (i / 5);
        slot = data_ov002_022d016c.idx % 5;
        if (data_ov002_022cf16c[player & 1].slots[slot].id != 0 &&
            func_ov002_021b3ecc(player, slot, arg) != 0) {
            if (func_ov002_021de480(player, slot, 0, 0) == 0)
                func_ov002_021d5b80(player, slot, arg, 1);
            data_ov002_022d016c.idx++;
            return 0;
        }
        data_ov002_022d016c.idx++;
    }
    return 1;
}
