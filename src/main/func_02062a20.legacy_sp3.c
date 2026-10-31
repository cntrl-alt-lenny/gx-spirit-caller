typedef struct {
    char *data;
    int cap;
    int len;
} buf_0206133c_t;
typedef buf_0206133c_t buf_020613d8_t;
typedef struct {
    int f0;
    unsigned short f4;
    char _6[2];
    int f8;
    char _c[0x44];
    buf_020613d8_t buf;
    char _5c[0x2c];
    int f88;
} obj_02062280_t;
extern int func_02062280(obj_02062280_t *o, int a, int b);
extern void func_0206133c(buf_0206133c_t *b, int off, int n);
extern void func_020613d8(buf_020613d8_t *b, signed char *src, int n);
extern int func_02061530(void *p);
extern int func_020a7440(unsigned char *p0, unsigned char *p1, int count);
extern unsigned char data_02101530[];

int func_02062a20(obj_02062280_t *o, unsigned char *src, int len) {
    int total;
    char *start;
    if (len < 2 || func_020a7440(src, data_02101530, 2) != 0) {
        if (func_02062280(o, (int)src, len) == 0) { return 0; }
        return 1;
    }
    total = len + 2;
    if (func_02061530(&o->buf) < total) {
        return 1;
    }
    start = o->buf.data + o->buf.len;
    func_020613d8(&o->buf, (signed char *)data_02101530, 2);
    func_020613d8(&o->buf, (signed char *)src, len);
    if (func_02062280(o, (int)start, total) == 0) {
        return 0;
    }
    func_0206133c(&o->buf, -1, total);
    return 1;
}

