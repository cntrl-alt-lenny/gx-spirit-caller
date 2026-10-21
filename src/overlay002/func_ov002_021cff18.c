typedef unsigned short u16;
typedef unsigned char u8;
typedef struct { u16 f0, f2, f4, f6; char pad[0x804]; int f80c, f810; } Ctx;
typedef struct { unsigned int id:13; unsigned int flag:1; unsigned int unused:8; unsigned int value:8; unsigned int extra:2; } Card;
typedef struct { char pad[0x30]; struct { Card card; char pad[16]; } slots[11]; char tail[0x75c]; } Player;
extern Ctx data_ov002_022ce950;
extern Player data_ov002_022cf16c[];
extern void func_ov002_021b1f20(int a0, int a1, int a2, int a3, int a4);
extern int func_ov002_0229ade0(int a, int b, int c, int d);
extern int func_ov002_0229c7f8(int a);
void func_ov002_021cff18(void) {
    int a = data_ov002_022ce950.f2 & 1;
    int b = data_ov002_022ce950.f2 >> 8;
    int c = data_ov002_022ce950.f4 & 1;
    int d = data_ov002_022ce950.f4 >> 8;
    int e = data_ov002_022ce950.f6;
    if (data_ov002_022ce950.f810 == 0) {
        Player *player = &data_ov002_022cf16c[a & 1];
        data_ov002_022ce950.f810++;
        Card *card = &player->slots[b].card;
        func_ov002_0229ade0(0x22, (u16)((u8)a | ((u8)b << 8)), (u16)((u8)c | ((u8)d << 8)), card->value * 2 + card->flag);
        return;
    }
    if (func_ov002_0229c7f8(0x22) != 0) return;
    func_ov002_021b1f20(c, d, e, data_ov002_022ce950.f2, 0);
    func_ov002_0229ade0(0x24, 0, 0, 0);
    data_ov002_022ce950.f80c = 0;
}


