/* func_0209e35c: sibling of func_0209e788 (func_0209db98 early-out)
 * and func_0209e628/func_0209f514 (func_0209dbb4()->field_4 "node"
 * pointer, re-read fresh before each func_020927e4-guarded access).
 * func_0209dbb4() is called ONCE and cached in "obj" (matching the
 * shipped sibling shape) -- obj->field_4 is re-read fresh at each
 * point since it's a value stored through the pointer, not the
 * pointer itself. Dispatches on the u16 tag at node[0]: tag 9 does
 * an extra validity check before falling through to the shared tag
 * 0xa/0xb tail that reads node[0xbc]. */

typedef struct {
    char _pad_0[4];
    unsigned char *field_4;
} Obj_0209e450_t;

extern Obj_0209e450_t *func_0209dbb4(void);
extern int func_0209db98(void);
extern void func_020927e4(void *field, int width);

int func_0209e35c(void) {
    Obj_0209e450_t *obj = func_0209dbb4();
    unsigned char *p;
    unsigned short tag;

    if (func_0209db98() != 0) {
        return 0;
    }

    p = obj->field_4;
    func_020927e4(p, 2);

    p = obj->field_4;
    tag = *(unsigned short *)p;

    switch (tag) {
    case 9:
        func_020927e4(p + 0x182, 2);
        p = obj->field_4;
        if (*(unsigned short *)(p + 0x182) == 0) {
            return 0;
        }
        /* fallthrough */
    case 0xa:
    case 0xb:
        func_020927e4(p + 0xbc, 2);
        p = obj->field_4;
        return *(unsigned short *)(p + 0xbc);
    default:
        return 0;
    }
}
