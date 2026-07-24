/* func_ov002_0229e14c: probe 8 stride-0x14 sub-elements via
 * func_ov002_0229d2c8; if any is truthy return 1, else fall back to
 * self->f_b4 != 0. */

extern int func_ov002_0229d2c8(void *arg0);

typedef struct {
    char pad[0xb4];
    int f_b4;
} Obj;

int func_ov002_0229e14c(Obj *self) {
    int i;
    char *e = (char *)self;
    for (i = 0; i < 8; i++, e += 0x14) {
        if (func_ov002_0229d2c8(e)) return 1;
    }
    return self->f_b4 != 0;
}
