/* func_0209f070: guard via func_0209e0f0(a0,a2); on success notifies
 * via func_0209de5c(0,a1), then submits func_0209dd30(0,3,...) with
 * 3 fields of the func_0209dca8() singleton (field_0, field_4,
 * field_10 -- the last passed on the stack as the 5th arg),
 * translating a zero result to 2. */

typedef struct {
    int field_0;
    int field_4;
    char pad_8[0x10 - 8];
    int field_10;
} Obj_0209f070_t;

extern int func_0209e0f0(int a0, int a2);
extern void func_0209de5c(int a0, int a1);
extern Obj_0209f070_t *func_0209dca8(void);
extern int func_0209dd30(int a0, int a1, int a2, int a3, int a4);

int func_0209f070(int a0, int a1, int a2) {
    Obj_0209f070_t *obj;
    int result = func_0209e0f0(a0, a2);

    if (result != 0) {
        return result;
    }

    func_0209de5c(0, a1);
    obj = func_0209dca8();
    result = func_0209dd30(0, 3, obj->field_0, obj->field_4, obj->field_10);

    return (result == 0) ? 2 : result;
}
