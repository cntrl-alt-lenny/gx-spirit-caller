/* func_0209f128: sibling of func_0209e450/e710 family (func_0209dbb4()
 * ->field_4 node). guard via func_0209da94(2,9,0xa); bails 3 if
 * node[0xc]==0; otherwise notifies via func_0209dd68(0x10,a0) and
 * submits func_0209dc3c(0x10,0), translating a zero result to 2. */

typedef struct {
    char _pad_0[4];
    unsigned char *field_4;
} Obj_0209f21c_t;

extern Obj_0209f21c_t *func_0209dbb4(void);
extern int func_0209da94(int a0, int a1, int a2);
extern void func_020927e4(void *p, int n);
extern void func_0209dd68(int a0, int a1);
extern int func_0209dc3c(int a0, int a1);

int func_0209f128(int a0) {
    Obj_0209f21c_t *obj = func_0209dbb4();
    int result = func_0209da94(2, 9, 0xa);
    unsigned char *p;

    if (result != 0) {
        return result;
    }

    p = obj->field_4;
    func_020927e4(p + 0xc, 4);
    p = obj->field_4;
    if (*(int *)(p + 0xc) == 0) {
        return 3;
    }

    func_0209dd68(0x10, a0);
    result = func_0209dc3c(0x10, 0);

    return (result == 0) ? 2 : result;
}
