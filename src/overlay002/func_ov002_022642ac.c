typedef unsigned int u32;
typedef struct {
    u32 id : 13;
    u32 rest : 19;
    u32 pad;
    unsigned short hp;
    unsigned short pad2;
    u32 pad3;
    u32 flags;



} Slot;
typedef struct {
    char pad0[0x30];
    Slot slots[5];
    char pad1[0x7d4];
} Side;
extern Side data_ov002_022cf16c[2];
extern struct { char pad[0xd28]; int idx; } data_ov002_022d016c;
extern int func_ov002_021bb068(int a);
extern int func_ov002_021bae7c(int a, int b, int c);
extern int func_ov002_021c84e0();
extern void func_ov002_021df680(int arg0, int arg1);
extern void func_ov002_021de41c(int a, int b, int c);
int func_ov002_022642ac(int a)
{
    int side, slot, bits;
    if (data_ov002_022d016c.idx != 0) return 1;
    if (func_ov002_021bb068(0x13f8) != 0) {
        bits = 0;
        for (side = 0; side < 2; side++) {
            for (slot = 0; slot < 5; slot++) {
                if (data_ov002_022cf16c[side & 1].slots[slot].id != 0 &&
                    data_ov002_022cf16c[side & 1].slots[slot].hp != 0 &&
                    func_ov002_021c84e0(side, slot) <= 3 &&
                    (data_ov002_022cf16c[side & 1].slots[slot].flags >> 16 & 1 ||
                     data_ov002_022cf16c[side & 1].slots[slot].flags >> 17 & 1))
                    bits |= 1 << (slot + side * 16);
            }
        }
        if (bits != 0) {
            int target = 1 - a;
            if (func_ov002_021bae7c(target, 0x13f8, -1) == 0) target = a;
            func_ov002_021df680(-1, 0x13f8);
            func_ov002_021de41c(target, 0x13f8, bits);
            data_ov002_022d016c.idx++;
            return 0;
        }
    }
    return 1;
}



