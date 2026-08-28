/* func_0206ad88: try func_02054c84(a0->field_4b0, a1, a2, 0) up to twice
 * (1 retry). On success (>0) or exhausted retries, fall through to the
 * tail. Otherwise run func_0206a9f4/func_0206ab14; if func_0206ab14
 * finds something, release via func_0206b1e4 and return it. */

extern int func_02054c84(void *cb, void *a1, void *a2, int flag);
extern void func_0206a9f4(void *a0);
extern int func_0206ab14(void *a0, int a1, int a2, int mode, int a4);
extern void func_0206b1e4(void *a0);

typedef struct {
    unsigned char _pad_00[0x4b0];
    void *field_4b0;
} Obj_0206adfc_t;

int func_0206ad88(Obj_0206adfc_t *a0, void *a1, void *a2) {
    int result;
    int retry = 1;
    do {
        retry -= 1;
        result = func_02054c84(a0->field_4b0, a1, a2, 0);
        if (result > 0) {
            break;
        }
        if (retry < 0) {
            break;
        }
        func_0206a9f4(a0);
        {
            int obj = func_0206ab14(a0, 0, 0, 2, 0);
            if (obj != 0) {
                func_0206b1e4(a0);
                return obj;
            }
        }
    } while (retry >= 0);
    return (result <= 0) ? 3 : 0;
}
