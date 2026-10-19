typedef unsigned int u32;
typedef unsigned short u16;
typedef struct {
    u32 id:13;
    u32 flag:1;
    u32 pad:8;
    u32 value:8;
    u32 high:2;
    u32 rest[4];
} Slot;
typedef struct {
    char pad[0x30];
    Slot slots[10];
    char tail[0x770];
} Side;
extern Side data_ov002_022cf16c[2];
extern struct { char pad[0xd28]; u32 idx; } data_ov002_022d016c;
extern int func_ov002_021baca8(int a0, int a1, int a2);
extern int func_ov002_021b9ecc(int a0, int a1);
extern int func_ov002_021e30b4(int arg0, int arg1, int arg2);
int func_ov002_02264a00(u32 self) {
    u32 i = data_ov002_022d016c.idx;
    while (i < 10) {
        int side = self ^ (i / 5);
        int slot = i % 5 + 5;
        if (func_ov002_021baca8(side, slot, 0x17f8) != 0) {
            Slot *entry = &data_ov002_022cf16c[side & 1].slots[slot];
            int id = func_ov002_021b9ecc(side, slot);
            u32 packed = ((side << 31) & 0x80000000) | 0x0a000000 | (((side ^ self) << 24) & 0x01000000) | 0x200000 | ((slot << 16) & 0x1f0000) ;
            func_ov002_021e30b4(packed | (u16)id,
                              (u16)(entry->value * 2 + entry->flag), 0);
            data_ov002_022d016c.idx++;
            return 0;
        }
        i = data_ov002_022d016c.idx + 1;
        data_ov002_022d016c.idx = i;
    }
    return 1;
}


