/* func_02026ed4: bit set/clear clone, field at offset 0x158. */

struct Obj02026f28 {
    char _pad[0x158];
    unsigned int flags;
};

int func_02026ed4(struct Obj02026f28 *obj, int idx, int value)
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
