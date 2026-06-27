

typedef struct Entity {
    unsigned short id;
    unsigned short turn : 1;
} Entity;

extern int func_ov002_02259e8c(int side);
extern int func_ov002_02280870(int side);
extern int func_ov002_021bbe70(int side);

int func_ov002_022962b4(Entity *e) {
    if (func_ov002_02259e8c(e->turn) == 0)
        return 0;
    if (func_ov002_02280870(e->turn) <= 0)
        return 0;
    return func_ov002_021bbe70(1 - e->turn) >= 3;
}
