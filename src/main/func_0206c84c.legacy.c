typedef struct {
    void *field_0;
    void *field_4;
    void *field_8;
    signed char field_c;
    unsigned char field_d;
} Obj_0206bf94_t;

extern Obj_0206bf94_t *func_0206bf94(void *a0, char *a1, int a2);
extern int func_0206c7c0(void *self);
/* The original caller also passes the request in r1. */
extern int func_0206be54(int *p, void *req);

int func_0206c84c(char *self) {
    Obj_0206bf94_t *result = func_0206bf94((void *)func_0206c7c0, self, *(signed char *)(self + 0x72));
    if (result == 0) {
        return -0x21;
    }
    *(unsigned short *)((char *)result + 0x10) = *(unsigned short *)(self + 0x74);
    *(unsigned short *)((char *)result + 0x12) = *(unsigned short *)(self + 0x76);
    *(int *)((char *)result + 0x14) = *(int *)(self + 0x78);
    *(short *)(self + 0x70) |= 2;
    return func_0206be54((int *)self, result);
}

