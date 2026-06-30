/* func_02026e84: bit set/clear clone, field at offset 0x154. */

struct Obj02026ed8 {
    char _pad[0x154];
    unsigned int flags;
};

int func_02026e84(struct Obj02026ed8 *obj, int idx, int value)
{
    if (idx < 0) {
        obj->flags = value ? (unsigned int)-1 : 0u;
    } else if (value) {
        obj->flags = obj->flags | (1u << idx);
    } else {
        obj->flags = obj->flags & ~(1u << idx);
    }
    return 1;
}
