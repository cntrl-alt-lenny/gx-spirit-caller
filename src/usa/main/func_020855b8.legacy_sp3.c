typedef struct {
    unsigned int flags;
} Obj_020856a0_t;

extern void func_02084d24(int a0, void *a1, int a2);

void func_020855b8(Obj_020856a0_t *a0) {
    unsigned int flags = a0->flags;

    if (!(flags & 4)) {
        if (!(flags & 2)) {
            func_02084d24(0x19, (char *)a0 + 0x28, 0xc);
        } else {
            func_02084d24(0x1c, (char *)a0 + 0x4c, 3);
        }
    } else if (!(flags & 2)) {
        func_02084d24(0x1a, (char *)a0 + 0x28, 9);
    }

    if (!(a0->flags & 1)) {
        func_02084d24(0x1b, (char *)a0 + 0x4, 3);
    }
}
