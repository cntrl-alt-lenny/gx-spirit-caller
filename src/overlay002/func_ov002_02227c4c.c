typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 f0; u16 side:1; u16 index:5; u16 rest:10; u16 pad:6; u16 value:9; u16 tail:1; } Unit;
typedef struct { u32 id:13; u32 flag:1; u32 rest:8; u32 value:8; u32 tail:2; } Card;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern void func_ov002_021d91e0(int a, int b, int c);
int func_ov002_02227c4c(Unit *self) {
    int a = self->side;
    int b = self->index;
    Card *p = (Card *)(data_ov002_022cf16c + (a & 1) * 0x868 + 0x30 + b * 0x14);
    if (self->value != p->value * 2 + p->flag) return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + (a & 1) * 0x868 + b * 0x14) == 0) return 0;
    func_ov002_021d91e0(a, b, 1);
    return 0;
}

