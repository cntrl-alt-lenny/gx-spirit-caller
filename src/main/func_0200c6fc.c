/* func_0200c6fc: bit set/clear clone, field at offset 0x74. */

struct Obj0200c6fc {
    char _pad[0x74];
    unsigned int flags;
};

int func_0200c6fc(struct Obj0200c6fc *obj, int idx, int value)
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
