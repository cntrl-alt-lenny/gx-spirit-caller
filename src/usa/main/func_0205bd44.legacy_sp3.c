/* func_0205bd44: if a1->mode==3, release a1->field_4's sub-resources
 * (decrementing a0->counter and logging if it goes negative), then
 * unconditionally release a1->field_4 and finally a1 itself. */

extern void func_020a6c60(const char *msg1, const char *msg2, int a2, int a3);
extern void func_02054de0(void *p, int mode);
extern void func_02054dfc(void *p);
extern void func_02045364(void *p);

extern char data_02100a08[];
extern char data_021009f8[];

typedef struct {
    unsigned char _pad_00[0x210];
    int counter;
} InnerCtx_0205bdb8_t;

typedef struct {
    InnerCtx_0205bdb8_t *ctx;
} Ctx_0205bdb8_t;

typedef struct {
    int mode;
    void *field_4;
} Obj_0205bdb8_t;

typedef struct {
    unsigned char _pad_00[0x4];
    void *field_4;
    void *field_8;
    unsigned char _pad_0c[0xc];
    void *field_18;
} Target_0205bdb8_t;

void func_0205bd44(Ctx_0205bdb8_t *a0, Obj_0205bdb8_t *a1) {
    InnerCtx_0205bdb8_t *ctx = a0->ctx;
    if (a1->mode == 3) {
        Target_0205bdb8_t *target = a1->field_4;
        ctx->counter -= 1;
        if (ctx->counter < 0) {
            func_020a6c60(data_02100a08, data_021009f8, 0, 0xb6);
        }
        func_02054de0(target->field_4, 2);
        func_02054dfc(target->field_4);
        func_02045364(target->field_18);
        target->field_18 = 0;
        func_02045364(target->field_8);
        target->field_8 = 0;
    }
    func_02045364(a1->field_4);
    a1->field_4 = 0;
    func_02045364(a1);
}
