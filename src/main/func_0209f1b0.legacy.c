/* func_0209f1b0: sibling of func_0209f070. guard via
 * func_0209db88(1,0); on success notifies via func_0209de5c(3,a0),
 * then submits func_0209dd30(3,3,...) with 3 fields of the
 * func_0209dca8() singleton, translating a zero result to 2. */

typedef struct {
    int field_0;
    int field_4;
    char pad_8[0x10 - 8];
    int field_10;
} Obj_0209f1b0_t;

extern int func_0209db88(int a0, int a1);
extern void func_0209de5c(int a0, int a1);
extern Obj_0209f1b0_t *func_0209dca8(void);
extern int func_0209dd30(int a0, int a1, int a2, int a3, int a4);

int func_0209f1b0(int a0) {
    Obj_0209f1b0_t *obj;
    int result = func_0209db88(1, 0);

    if (result != 0) {
        return result;
    }

    func_0209de5c(3, a0);
    obj = func_0209dca8();
    result = func_0209dd30(3, 3, obj->field_0, obj->field_4, obj->field_10);

    return (result == 0) ? 2 : result;
}
