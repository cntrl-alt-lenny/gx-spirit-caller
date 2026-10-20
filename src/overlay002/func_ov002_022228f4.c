typedef unsigned short u16;
typedef struct { u16 f0; u16 flag0:1; u16 field:5; u16 value:6; u16 :4; } Card021c1e44;
struct State { char pad[0x5a8]; int state; };
struct Other { char pad[0xcec]; int flag; };
struct Ready { int ready; char pad[0x864]; };
extern struct State data_ov002_022ce288;
extern struct Other data_ov002_022d016c;
extern struct Ready data_ov002_022cf178[];
extern void func_ov002_021d479c(u16 a0, u16 a1, u16 a2, u16 a3);
extern void func_ov002_021d71e0(int a, int b, int c);
extern int func_ov002_021dea34(int a, int b);
extern int func_ov002_021df4d8(Card021c1e44 *card, int idx);
/* Original passes only r0 and r1; the thunk's remaining inputs are unused here. */
extern int func_ov002_021e104c();
extern int func_ov002_021e286c(int arg0);
int func_ov002_022228f4(Card021c1e44 *self) {
    int i;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        func_ov002_021dea34((int)self, -1);
        if ((self->value) == 0x15) {
            func_ov002_021df4d8(self, 0);
            func_ov002_021df4d8(self, 1);
        }
        return 0x7f;
    case 0x7f:
        for (i=0; i<2; i++)
            func_ov002_021d479c((u16)(((data_ov002_022d016c.flag ^ i) ? 0x8000 : 0) | 0x5a), 1, 0, 0);
        return 0x7e;
    case 0x7e:
        { int side = data_ov002_022d016c.flag;
        if (data_ov002_022cf178[side & 1].ready == 0) return 0x7d;
        func_ov002_021d71e0(side, 0, 1); }
        return 0x7e;
    case 0x7d:
        { int side = 1-data_ov002_022d016c.flag;
        if (data_ov002_022cf178[side & 1].ready == 0) return 0x7c;
        func_ov002_021d71e0(side, 0, 1); }
        return 0x7d;
    case 0x7c:
        for (i=0; i<2; i++) func_ov002_021e286c(data_ov002_022d016c.flag ^ i);
        return 0x7b;
    case 0x7b:
        for (i=0; i<2; i++) func_ov002_021e104c(data_ov002_022d016c.flag ^ i, 5);
        return 0;
    default: return 0;
    }
}

