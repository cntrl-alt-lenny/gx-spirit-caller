typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef int s32;

typedef struct {
    s32 hp;
    u8 pad[0x868 - 4];
} Side;

extern Side data_ov002_022cf16c[];

typedef struct {
    u16 a;
    u16 side : 1;
    u16 rest : 15;
} Arg;

s32 func_ov002_02291f00(Arg *p)
{
    u32 side = p->side;

    if (data_ov002_022cf16c[(1 - side) & 1].hp <= 500) {
        return 1;
    }
    return data_ov002_022cf16c[side & 1].hp > 0x868 - 0x28c;
}
