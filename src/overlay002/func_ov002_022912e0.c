struct Obj {
    unsigned short pad0;
    unsigned short side : 1;
};

struct Side {
    int val;
    char pad[0x864];
};

extern struct Side data_ov002_022cf16c[2];

extern int func_ov002_021bae7c(int a, int b, int c);
extern int func_ov002_021c3ae4(int a, int b);
extern int func_ov002_021ba6cc(int a, int b);
extern void func_ov002_0220eb00(struct Obj *obj, int *out);

int func_ov002_022912e0(struct Obj *obj)
{
    int vals[2];
    int side;
    int other;
    int a;

    if (func_ov002_021bae7c(obj->side, 0x159b, -1)) {
        return 1;
    }
    func_ov002_0220eb00(obj, vals);
    side = obj->side;
    other = 1 - side;
    if (vals[other] == 0) {
        return 0;
    }
    if (data_ov002_022cf16c[other & 1].val <= vals[other]) {
        return 1;
    }
    a = func_ov002_021c3ae4(side, 0x159b);
    return (a + func_ov002_021ba6cc(side, 0x159b)) == 0;
}
