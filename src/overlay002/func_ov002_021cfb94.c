typedef unsigned short u16;
typedef struct { u16 f0, f2, f4; char pad[0x806]; int f80c, f810; } Ctx;
typedef struct { unsigned int id:13; unsigned int extra:1; unsigned int rest:8; unsigned int value:8; unsigned int tail:2; } Card;
typedef struct { Card card; int f4; u16 f8; u16 fa; int fc; unsigned int flags; } Slot;
typedef struct { char pad[0x30]; Slot slots[11]; char tail[0x75c]; } Player;
extern Ctx data_ov002_022ce950;
extern Player data_ov002_022cf16c[];
extern int func_0202e234(int x);
extern int func_ov002_0229ade0(int a, int b, int c, int d);
extern int func_ov002_0229c7f8(int a);
void func_ov002_021cfb94(void) {
    int flag = (data_ov002_022ce950.f0 & 0x8000) != 0;
    int id = data_ov002_022ce950.f2;
    int both = data_ov002_022ce950.f4;
    int i, count, start, end, side;
    switch (data_ov002_022ce950.f810) {
    case 0:
        func_ov002_0229ade0(0x43, flag, id, 0);
        data_ov002_022ce950.f810++;
        break;
    case 1:
        if (func_ov002_0229c7f8(0x43) != 0) return;
        count = 0;
        if (func_0202e234(id) != 0) { start = 0; end = 4; }
        else { start = 5; end = 10; }
        for (side = 0; side < 2; side++) {
            if (both != 0 || side == flag) {
                for (i = start; i <= end; i++) {
                    if (id == data_ov002_022cf16c[side & 1].slots[i].card.id && (data_ov002_022cf16c[side & 1].slots[i].f8 & ~((data_ov002_022cf16c[side & 1].slots[i].flags >> 6) & 1) & ~(((data_ov002_022cf16c[side & 1].slots[i].flags >> 1) | (data_ov002_022cf16c[side & 1].slots[i].flags >> 2)) & 1))) {
                        func_ov002_0229ade0(0x20, (u16)((side & 1) | ((i & 31) << 1)), id, data_ov002_022cf16c[side & 1].slots[i].card.value * 2 + data_ov002_022cf16c[side & 1].slots[i].card.extra);
                        count++;
                    }
                }
            }
        }
        if (count == 0) func_ov002_0229ade0(0x20, (flag & 1) | 0x20, id, 0);
        data_ov002_022ce950.f810++;
        break;
    case 2:
        if (func_ov002_0229c7f8(0x20) == 0) data_ov002_022ce950.f80c = 0;
        break;
    }
}


