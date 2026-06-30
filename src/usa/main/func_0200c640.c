/* func_0200c640: bit set/clear clone, field at offset 0x6c. */

struct Obj0200c65c {
    char _pad[0x6c];
    unsigned int flags;
};

int func_0200c640(struct Obj0200c65c *obj, int idx, int value)
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
