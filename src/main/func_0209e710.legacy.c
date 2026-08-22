/* func_0209e710: sibling of func_0209e450 (same func_0209dca8()->
 * field_4 "node" pattern, obj cached once). Bails 0 on
 * func_0209db88(2,7,8) failure or node[0xc]==1; otherwise returns
 * node[0x3c] (u16) rounded up to the next multiple of 0x20. */

typedef struct {
    char _pad_0[4];
    unsigned char *field_4;
} Obj_0209e710_t;

extern Obj_0209e710_t *func_0209dca8(void);
extern int func_0209db88(int a0, int a1, int a2);
extern void func_020928cc(void *field, int width);

int func_0209e710(void) {
    Obj_0209e710_t *obj = func_0209dca8();
    unsigned char *p;
    int v;
    unsigned short h;

    if (func_0209db88(2, 7, 8) != 0) {
        return 0;
    }

    p = obj->field_4;
    func_020928cc(p + 0xc, 4);

    p = obj->field_4;
    v = *(int *)(p + 0xc);
    if (v == 1) {
        return 0;
    }

    func_020928cc(p + 0x3c, 4);
    p = obj->field_4;
    h = *(unsigned short *)(p + 0x3c);

    return (h + 0x1f) & ~0x1f;
}
