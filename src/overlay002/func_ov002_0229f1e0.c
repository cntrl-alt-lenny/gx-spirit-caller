struct Obj { int f0, f4, kind, fc, f10, f14, state, value; };
extern struct { char pad[0xd4]; int value; } data_ov002_022d0f2c;
extern struct { int f0, value; } data_ov002_022d11bc;
extern int data_ov002_022d016c[];
extern int func_02037208(int a0, int r1, int r2, int r3);

void func_ov002_0229f1e0(struct Obj *obj)
{
    if (obj->kind >= 16) {
        obj->state = 15;
        data_ov002_022d0f2c.value = data_ov002_022d0f2c.value < 2 ? 2 : data_ov002_022d0f2c.value;
        if (data_ov002_022d11bc.value == 3)
            func_02037208(0x56, -1, 0, 3);
        else
            func_02037208(0x38, -1, 0, 3);
    } else {
        obj->state = 1;
        data_ov002_022d0f2c.value = data_ov002_022d0f2c.value < 16 ? 16 : data_ov002_022d0f2c.value;
        switch (obj->kind) {
        case 1:
            func_02037208(0x42, -1, 0, 1);
            break;
        case 15:
            if (obj->value == data_ov002_022d016c[0x33e])
                func_02037208(0x42, -1, 0, 1);
            else
                func_02037208(0x3a, -1, 0, 1);
            break;
        default:
            func_02037208(0x3a, -1, 0, 1);
            break;
        }
    }
}

