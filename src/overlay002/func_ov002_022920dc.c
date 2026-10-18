typedef unsigned short u16;

struct Obj20dc {
    u16 f0;
    u16 player : 1;
    u16 k : 5;
    u16 _pad : 10;
};

extern int func_ov002_021bbd14(int player, int arg);
extern int func_ov002_02280980(int player);

int func_ov002_022920dc(struct Obj20dc *obj)
{
    int b, a, c, d;
    int sum;

    a = func_ov002_021bbd14(obj->player, 0x187c);
    b = func_ov002_021bbd14(obj->player, 0x1400);
    c = func_ov002_021bbd14(obj->player, 0x1102);
    d = func_ov002_021bbd14(obj->player, 0x134a);
    sum = a + (b + (c + d));
    sum -= (obj->k <= 10);

    if (sum > 0) {
        return 0;
    }
    return func_ov002_02280980(obj->player) < 0;
}
