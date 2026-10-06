typedef struct {
    char           _0[0x50];
    char           buf[0x14];
    unsigned short seq;
    unsigned short id;
} obj_02062eec_t;

extern unsigned char data_02101530[];
extern int func_02061530(void *p);
extern int func_020643ac(void *self);
extern int func_02062fc0(void *a0, unsigned short a1, int a2);
extern void func_020613d8(void *dst, void *src, unsigned int len);
extern void func_020614d8(void *self, int val);
extern void func_02061464(void *self, int val);

int func_02062eec(obj_02062eec_t *o, int mode, int need, int *out) {
    if (func_02061530(o->buf) < need) {
        if (func_020643ac(o) == 0) {
            return 0;
        }
        *out = 1;
        return 1;
    }
    if (func_02062fc0(o, o->seq, need) == 0) {
        if (func_020643ac(o) == 0) {
            return 0;
        }
        *out = 1;
        return 1;
    }
    func_020613d8(o->buf, data_02101530, 2);
    func_020614d8(o->buf, (unsigned char)mode);
    func_02061464(o->buf, o->seq++);
    func_02061464(o->buf, o->id);
    *out = 0;
    return 1;
}
