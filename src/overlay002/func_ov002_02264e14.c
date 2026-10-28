typedef unsigned int u32;
typedef struct { u32 id:13; u32 rest:19; u32 pad[4]; } Slot;
typedef struct { char pad[0x30]; Slot slots[5]; char tail[0x7d4]; } Side;
extern Side data_ov002_022cf16c[2];
extern struct { char pad[0xd28]; u32 idx; } data_ov002_022d016c;
extern int func_ov002_021b3ecc(int arg0, int arg1, int arg2);
extern void func_ov002_021d5b80(int arg0, int arg1, int arg2, int arg3);
int func_ov002_02264e14(u32 a) {
    while (data_ov002_022d016c.idx < 10) {
        u32 i = data_ov002_022d016c.idx;
        int side;
        int slot;
        side = a ^ (i / 5);
        slot = data_ov002_022d016c.idx % 5;
        if (data_ov002_022cf16c[side & 1].slots[slot].id != 0 &&
            func_ov002_021b3ecc(side, slot, 0x1a74) != 0) {
            func_ov002_021d5b80(side, slot, 0x1a74, 1);
            func_ov002_021d5b80(side, slot, 0x1419, 1);
            data_ov002_022d016c.idx++;
            return 0;
        }
        data_ov002_022d016c.idx++;
    }
    return 1;
}
