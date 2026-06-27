

typedef struct Entity {
    unsigned short id;
    unsigned short turn : 1;
} Entity;

extern int func_ov002_021c3a04(int player, int code);
extern int func_ov002_02281650(int e, int side, int one);
extern int func_ov002_022579d0(int a, int b);

int func_ov002_022964b0(Entity *e) {
    if (func_ov002_021c3a04(e->turn, 0x198c) != 0)
        return 0;
    if (func_ov002_02281650((int)e, 1 - e->turn, 1) != 0)
        return 1;
    return func_ov002_022579d0((int)e, 1 - e->turn) > 1;
}
