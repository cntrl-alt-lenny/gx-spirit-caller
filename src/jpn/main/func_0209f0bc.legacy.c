/* func_0209f0bc: sibling of func_0209ef7c. guard via
 * func_0209da94(1,0); on success notifies via func_0209dd68(3,a0),
 * then submits func_0209dc3c(3,3,...) with 3 fields of the
 * func_0209dbb4() singleton, translating a zero result to 2. */

typedef struct {
    int field_0;
    int field_4;
    char pad_8[0x10 - 8];
    int field_10;
} Obj_0209f1b0_t;

extern int func_0209da94(int a0, int a1);
extern void func_0209dd68(int a0, int a1);
extern Obj_0209f1b0_t *func_0209dbb4(void);
extern int func_0209dc3c(int a0, int a1, int a2, int a3, int a4);

int func_0209f0bc(int a0) {
    Obj_0209f1b0_t *obj;
    int result = func_0209da94(1, 0);

    if (result != 0) {
        return result;
    }

    func_0209dd68(3, a0);
    obj = func_0209dbb4();
    result = func_0209dc3c(3, 3, obj->field_0, obj->field_4, obj->field_10);

    return (result == 0) ? 2 : result;
}
