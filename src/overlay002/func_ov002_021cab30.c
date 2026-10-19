typedef unsigned int u32;
typedef struct { unsigned short flags, slot; char pad[0x808]; int active, phase; } State;
typedef struct { unsigned int id:13; unsigned int bit:1; unsigned int rest:8; unsigned int value:8; unsigned int top:2; int other[4]; } Card;
typedef struct { char pad[0x30]; Card cards[5]; char tail[0x7d4]; } Player;
extern State data_ov002_022ce950;
extern char data_ov002_022cf16c[];
extern int data_ov002_022cd3f4[];
extern int func_ov002_021b9ecc(int player, int slot);
extern void func_ov002_021c9b2c(int arg0, int arg1, int arg2);
extern void func_ov002_021c9af0(int bit, int set);
extern int func_ov002_0229ade0(int code, ...);
extern int func_ov002_0229c7f8(int code);
void func_ov002_021cab30(void) {
    int i;
    int slot;
    u32 p;
    int other;
    int player;
    player = (data_ov002_022ce950.flags & 0x8000) != 0;
    slot = data_ov002_022ce950.slot;
    if (data_ov002_022ce950.phase == 0) {
        p = (u32)(data_ov002_022cf16c + (player & 1) * 0x868);
        data_ov002_022cd3f4[2] = 1;
        data_ov002_022cd3f4[0] = player;
        other = 1 - player;
        data_ov002_022cd3f4[1] = other;
        data_ov002_022cd3f4[7] = slot;
        data_ov002_022cd3f4[8] = 5;
        data_ov002_022cd3f4[10] = ((Player *)p)->cards[slot].value * 2 + ((Player *)p)->cards[slot].bit;
        data_ov002_022cd3f4[9] = 0;
        for (i = 0; i <= 4; i++, p += 0x14) {
            if (i != slot) {
                if (func_ov002_021b9ecc(player, i) == 0x1a79) ((Player *)p)->cards[0].other[2] = 0;
            }
        }
        func_ov002_021c9b2c(player, 0x12, 1);
        func_ov002_021c9af0(1, 1);
        func_ov002_0229ade0(0xb, slot, other, 5);
        data_ov002_022ce950.phase++;
    }
    if (func_ov002_0229c7f8(0xb) == 0) data_ov002_022ce950.active = 0;
}




