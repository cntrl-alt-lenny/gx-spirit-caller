/* func_0209ee20: guard via func_0209db88(1,2,a2) (a2 passed through
 * unmodified -- this function's own 3rd param, otherwise unused);
 * on success zeroes two fields of the func_0209dca8() singleton,
 * runs func_0209de5c(8,a0) and func_0209dd30(8,1,a1), translating a
 * zero result to 2. */

typedef struct {
    char pad_0[0x14c];
    int field_14c;
    unsigned short field_150;
} Obj_0209ee20_t;

extern int func_0209db88(int a0, int a1, int a2);
extern Obj_0209ee20_t *func_0209dca8(void);
extern void func_0209de5c(int a0, void *a1);
extern int func_0209dd30(int a0, int a1, int a2);

int func_0209ee20(void *a0, int a1, int a2) {
    Obj_0209ee20_t *obj;
    int result = func_0209db88(1, 2, a2);

    if (result != 0) {
        return result;
    }

    obj = func_0209dca8();
    obj->field_150 = 0;
    obj->field_14c = 0;

    func_0209de5c(8, a0);
    result = func_0209dd30(8, 1, a1);

    return (result == 0) ? 2 : result;
}
