typedef struct {
    void *field_0;
    void *field_4;
    void *field_8;
    signed char field_c;
    unsigned char field_d;
} Obj_0206bf94_t;

typedef struct {
    char pad[0xf8];
    int field_f8;
    unsigned short field_fc;
} State_0206cd0c_t;

/* The original passes the request in r1 through this thunk, as do nearby callers;
 * its existing C definition omits that forwarded second parameter. */
extern int func_0206be54(int *p, void *req);
extern Obj_0206bf94_t *func_0206bf94(void *a0, char *a1, int a2);
extern int func_0206ccfc(int *p);

int func_0206cd0c(int *p) {
    State_0206cd0c_t *state = *(State_0206cd0c_t **)((char *)p + 0x64);
    Obj_0206bf94_t *result;
    if (state->field_f8 < state->field_fc) {
        return 0;
    }
    result = func_0206bf94(func_0206ccfc, (char *)p, 0);
    if (result == 0) {
        return -33;
    }
    return func_0206be54(p, result);
}

