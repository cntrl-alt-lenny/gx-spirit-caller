extern char data_ov000_021c73e0[];
struct Obj {
    char pad[0x12c];
    short x, y, z;
    char pad2[0xe];
    int facing : 4;
};
void func_ov000_021aa840(int x, int y, int z) {
    struct Obj *obj = *(struct Obj **)data_ov000_021c73e0;
    switch (obj->facing) {
    case 1:
    case 2:
    case 3:
        obj->x = -x;
        obj->y = -y;
        obj->z = z;
        return;
    }
    obj->x = x;
    obj->y = y;
    obj->z = z;
}
