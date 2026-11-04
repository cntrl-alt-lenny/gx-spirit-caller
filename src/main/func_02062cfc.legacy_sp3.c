typedef struct {
    char *data;
    int cap;
    int len;
} buf_020613d8_t;

typedef struct {
    char _0[0x50];
    char buf[0x14];
    unsigned short seq;
    unsigned short id;
} obj_02062eec_t;

typedef struct {
    char _pad_50[0x50];
    int field_50;
    char _pad_60[0xc];
    void *field_60;
    char _pad_90[0x2c];
    int field_90;
} Obj02062e6c;

extern void func_020613d8(buf_020613d8_t *b, signed char *src, int n);
extern int func_02062eec(obj_02062eec_t *o, int mode, int need, int *out);
extern int func_02062e6c(Obj02062e6c *self);

typedef struct {
    char pad[0x50];
    buf_020613d8_t buf;
    char pad_5c[0x2c];
    int field_88;
    int field_8c;
} Obj02062cfc;

int func_02062cfc(Obj02062cfc *self, signed char *a1, signed char *a2) {
    int local;
    if (func_02062eec((obj_02062eec_t *)self, 2, 0x47, &local) == 0) {
        return 0;
    }
    if (local != 0) {
        return 1;
    }
    func_020613d8(&self->buf, a1, 0x20);
    func_020613d8(&self->buf, a2, 0x20);
    if (func_02062e6c((Obj02062e6c *)self) == 0) {
        return 0;
    }
    self->field_8c = self->field_88;
    return 1;
}


