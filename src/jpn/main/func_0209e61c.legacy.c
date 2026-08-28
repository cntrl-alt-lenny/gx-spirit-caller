/* func_0209e61c: sibling of func_0209e450 (same func_0209dbb4()->
 * field_4 "node" pattern, obj cached once). Bails 0 on
 * func_0209da94(2,7,8) failure or node[0xc]==1; otherwise returns
 * node[0x3c] (u16) rounded up to the next multiple of 0x20. */

typedef struct {
    char _pad_0[4];
    unsigned char *field_4;
} Obj_0209e710_t;

extern Obj_0209e710_t *func_0209dbb4(void);
extern int func_0209da94(int a0, int a1, int a2);
extern void func_020927e4(void *field, int width);

int func_0209e61c(void) {
    Obj_0209e710_t *obj = func_0209dbb4();
    unsigned char *p;
    int v;
    unsigned short h;

    if (func_0209da94(2, 7, 8) != 0) {
        return 0;
    }

    p = obj->field_4;
    func_020927e4(p + 0xc, 4);

    p = obj->field_4;
    v = *(int *)(p + 0xc);
    if (v == 1) {
        return 0;
    }

    func_020927e4(p + 0x3c, 4);
    p = obj->field_4;
    h = *(unsigned short *)(p + 0x3c);

    return (h + 0x1f) & ~0x1f;
}
