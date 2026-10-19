typedef struct { int x, y; } Vec;
typedef struct {
    char pad[0x28];
    unsigned short side : 1;
    unsigned short kind : 5;
    unsigned short rest : 10;
    short amount;
} Obj;
extern Vec func_ov002_0229ea40(int side, int kind);
extern int data_ov002_022cd73c[];
Vec func_ov002_0229ec04(Obj *obj) {
    Vec pos = func_ov002_0229ea40(obj->side, obj->kind);
    int n = obj->amount / 10;
    int flip;
    if (n > 3) n = 3;
    int a = obj->kind == 12;
    int b = obj->side == (data_ov002_022cd73c[1] ^ 1);
    flip = a ^ b;

    switch (n) {
    case 1: pos.y -= 1; break;
    case 2: pos.x += flip ? -1 : 1; pos.y -= 2; break;
    case 3: pos.x += flip ? -1 : 1; pos.y -= 3; break;
    }
    return pos;
}






