typedef struct {
    char _pad_108[0x108];
    int f108;                  /* +0x108 */
} Obj020556c8;

typedef struct {
    char _pad_8[0x8];
    int f8;                      /* +0x8 */
} Item020556c8;

extern int func_0205d648(void *arg0, int junk, Item020556c8 **out);

int func_02055654(void *self) {
    Obj020556c8 *obj;
    Item020556c8 *item;
    int junk;

    if (self == 0) {
        goto ret0_early;
    }
    obj = *(Obj020556c8 **)self;
    if (obj != 0) {
        goto main_path;
    }
ret0_early:
    return 0;
main_path:
    if (obj->f108 != 0) {
        return 0;
    }
    if (func_0205d648(self, junk, &item)) {
        if (item->f8 != 0) {
            return 1;
        }
    }
    return 0;
}
