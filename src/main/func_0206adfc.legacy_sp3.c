/* func_0206adfc: try func_02054cf8(a0->field_4b0, a1, a2, 0) up to twice
 * (1 retry). On success (>0) or exhausted retries, fall through to the
 * tail. Otherwise run func_0206aa68/func_0206ab88; if func_0206ab88
 * finds something, release via func_0206b258 and return it. */

extern int func_02054cf8(void *cb, void *a1, void *a2, int flag);
extern void func_0206aa68(void *a0);
extern int func_0206ab88(void *a0, int a1, int a2, int mode, int a4);
extern void func_0206b258(void *a0);

typedef struct {
    unsigned char _pad_00[0x4b0];
    void *field_4b0;
} Obj_0206adfc_t;

int func_0206adfc(Obj_0206adfc_t *a0, void *a1, void *a2) {
    int result;
    int retry = 1;
    do {
        retry -= 1;
        result = func_02054cf8(a0->field_4b0, a1, a2, 0);
        if (result > 0) {
            break;
        }
        if (retry < 0) {
            break;
        }
        func_0206aa68(a0);
        {
            int obj = func_0206ab88(a0, 0, 0, 2, 0);
            if (obj != 0) {
                func_0206b258(a0);
                return obj;
            }
        }
    } while (retry >= 0);
    return (result <= 0) ? 3 : 0;
}
