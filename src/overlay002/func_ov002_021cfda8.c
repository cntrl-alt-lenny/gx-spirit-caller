typedef unsigned short u16;
typedef struct { u16 f0, f2, f4; char pad[0x806]; int f80c, f810; } Ctx;
typedef struct { unsigned int id:13; unsigned int rest:19; } Card;
typedef struct { char pad[0x30]; struct { Card card; char pad[16]; } slots[11]; char tail[0x75c]; } Player;
extern Ctx data_ov002_022ce950;
extern Player data_ov002_022cf16c[];
typedef struct { u16 id:13; u16 rest:3; u16 extra; } CardInfo;
extern CardInfo data_ov002_022d0250[];
extern int func_ov002_021b947c(int val);
extern int func_ov002_021b9b64(int unused0);
extern int func_ov002_0229ade0(int a, int b, int c, int d);
extern int func_ov002_0229c7f8(int a);
void func_ov002_021cfda8(void) {
    int flag = (data_ov002_022ce950.f0 & 0x8000) != 0;
    int f2;
    int f4;
    f4 = data_ov002_022ce950.f4;
    f2 = data_ov002_022ce950.f2;
    int result = func_ov002_021b947c(f4);
    int hi = 0;
    switch (data_ov002_022ce950.f810) {
    case 0:
        if (f2 == 11 || f2 >= 16) {
            data_ov002_022ce950.f80c = 0;
            return;
        }
        if (flag == (result & 0xff) && f2 == (((int)(u16)result >> 8) & 0xff)) {
            hi = (u16)((unsigned int)result >> 16);
        } else if (f2 <= 10) {
            if (data_ov002_022cf16c[flag & 1].slots[f2].card.id == 0) {
                data_ov002_022ce950.f80c = 0;
                return;
            }
        }
        if (f2 == 14 && data_ov002_022d0250[f4].id == 0x1571) {
            unsigned int *p = (unsigned int *)func_ov002_021b9b64(f4);
            *p &= ~0x20000;
        }
        func_ov002_0229ade0(0x21, flag, f2, hi);
        data_ov002_022ce950.f810++;
        break;
    case 1:
        if (func_ov002_0229c7f8(0x21) == 0)
            data_ov002_022ce950.f80c = 0;
        break;
    }
}


