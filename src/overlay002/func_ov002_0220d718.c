typedef unsigned short u16;

typedef struct Entity {
    u16 field0;
    u16 a : 1;
    u16 b : 5;
    u16 c : 6;
    u16   : 4;
} Entity;

extern int  data_ov002_022cf178[];
extern int  data_ov002_022d016c[];

int func_ov002_0220d718(Entity *self)
{
    int bit0 = self->a;
    if (data_ov002_022d016c[0xcec / 4] == bit0) return 0;
    if (data_ov002_022d016c[0xcf8 / 4] != 1) return 0;
    return *(int *)((char *)data_ov002_022cf178 + ((1 - bit0) & 1) * 0x868) != 0;
}
