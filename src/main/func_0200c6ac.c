/* func_0200c6ac: bit set/clear clone, field at offset 0x70. */

struct Obj0200c6ac {
    char _pad[0x70];
    unsigned int flags;
};

int func_0200c6ac(struct Obj0200c6ac *obj, int idx, int value)
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
