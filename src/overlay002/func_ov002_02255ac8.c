typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
struct Bits { u32 id:13; u32 flag:1; u32 pad:8; u32 idx:8; u32 rest:2; };
struct Entry { struct Bits bits; char pad[16]; };
struct Player { char pad[48]; struct Entry cards[5]; char tail[2004]; };
struct FlagEntry { u32 flags; char pad[16]; };
struct FlagPlayer { struct FlagEntry entries[5]; char tail[2052]; };
extern struct Player data_ov002_022cf16c[];
extern struct FlagPlayer data_ov002_022cf1ac[];
extern int func_ov002_021b3618(int player, int idx);
extern int func_ov002_021b9d34(int arg0, int arg1);
extern int func_ov002_021d9144(int arg0, int arg1, int arg2);
extern int func_ov002_021b9bd4(int player, int idx);
extern void func_ov002_021d5ab4(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_021df62c(int arg0, int arg1, int idx);
extern int func_ov002_021b9ecc(int a, int b);
extern int func_ov002_021de480(int arg0, int arg1, int arg2, int arg3);
void func_ov002_02255ac8(int player, int slot, int flag)
{
    int pair = func_ov002_021b3618(player, slot);
    int lo, hi;
    if (pair != 0xffff) {
        if (func_ov002_021b9d34(player, slot) != 0) {
            lo = (u8)pair;
            hi = (u8)((u16)pair >> 8);
            func_ov002_021d9144(player, slot, 1);
            if (func_ov002_021b9bd4(player, slot) + 1 >= 3) {
                func_ov002_021d5ab4(lo, hi, (u16)((u8)player | ((u8)slot << 8)), 1);
                if (flag == 0) {
                    if (((data_ov002_022cf1ac[player & 1].entries[slot].flags >> 6) & 1) == 0) {
                        func_ov002_021df62c(player, slot, data_ov002_022cf16c[player & 1].cards[slot].bits.idx * 2 + data_ov002_022cf16c[player & 1].cards[slot].bits.flag);
                        func_ov002_021de480(lo, hi, lo != player, func_ov002_021b9ecc(player, slot));
                    }
                }
            }
        }
    }
}




