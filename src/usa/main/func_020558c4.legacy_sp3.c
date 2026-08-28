typedef struct {
    char _pad0[0x10];
    void *f_10;
    int f_14;
} item_t;

typedef struct {
    char _pad0[0x100];
    int f_100;
    char _pad1[0x108 - 0x104];
    int f_108;
    char _pad2[0x1d8 - 0x10c];
    int f_1d8;
} obj_t;

extern void func_02045364(void *x);
extern int func_0205d44c(item_t *item);
extern void func_0205d600(void *arg0, item_t *item);
extern int func_0205d648(void *arg0, int junk, item_t **out);
extern int func_0205ff4c(void *arg0, void *key);

extern char data_020ffb30[];

int func_020558c4(void *arg0) {
    obj_t *obj;
    item_t *item;
    int junk;

    if (arg0 == 0) {
        goto ret2_early;
    }
    obj = *(obj_t **)arg0;
    if (obj != 0) {
        goto main_path;
    }
ret2_early:
    return 2;
main_path:
    if (obj->f_108 != 0) {
        return 0;
    }
    if (obj->f_1d8 == 4) {
        func_0205ff4c(arg0, data_020ffb30);
        return 2;
    }
    if (!func_0205d648(arg0, junk, &item)) {
        return 0;
    }
    item->f_14 -= 1;
    if (obj->f_100 == 0 && item->f_14 <= 0) {
        func_02045364(item->f_10);
        item->f_10 = 0;
        if (func_0205d44c(item) != 0) {
            func_0205d600(arg0, item);
        }
    }
    return 0;
}
