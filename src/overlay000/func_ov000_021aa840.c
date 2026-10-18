extern char data_ov000_021c73e0[];
struct Obj {
    char pad[0x12c];
    short x, y, z;
    char pad2[0xe];
    int facing : 4;
};
void func_ov000_021aa840(int x, int y, int z) {
    struct Obj *obj = *(struct Obj **)data_ov000_021c73e0;
    if (obj->facing == 1) goto reverse;
    if (obj->facing == 2) goto reverse;
    if (obj->facing != 3) goto normal;
reverse:
    obj->x = -x;
    obj->y = -y;
    obj->z = z;
    return;
normal:
    obj->x = x;
    obj->y = y;
    obj->z = z;
}
