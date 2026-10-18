extern void func_0201e800(void *p, int lo16);
extern void func_0201e964(int a, int b, void *c, int d,
                           int s0, int s1, int s2, int s3,
                           int s4, int s5, int s6, int s7);

typedef struct {
    char pad_2c[0x2c];
    int field_2c;
} Ctx;

typedef struct {
    int field_0;
    int field_4;
    char pad_8[8];
    Ctx *ctx;
} Obj;

void func_ov004_021ca0a4(Obj *obj, int mode, int x0, int x1,
                          int a4, int a5) {
    int coord[2];

    coord[0] = x0 << 12;
    coord[1] = x1 << 12;
    func_0201e800(obj->ctx, a5 & 0xffff);
    func_0201e964(mode, obj->ctx->field_2c, coord, 0,
                  0, 0, 0, a4, obj->field_4, obj->field_0 << 9, 0, 0);
}

