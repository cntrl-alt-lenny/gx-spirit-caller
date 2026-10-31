struct Obj {
    char pad[0x16a];
    unsigned short low : 12;
    unsigned short flags : 4;
};
int func_02026e38(struct Obj *obj, int idx, int value)
{
    if (idx < 0) {
        obj->flags = value ? 15 : 0;
    } else if (value) {
        obj->flags = obj->flags | (1 << idx);
    } else {
        obj->flags = obj->flags & ~(1 << idx);
    }
    return 1;
}
