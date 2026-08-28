/* func_0209e534: fetches the singleton object from func_0209dbb4(),
 * runs a check via func_0209da94(2,7,8) (bail with 0 on failure),
 * refreshes several fields of obj->inner via func_020927e4(addr, len),
 * and returns a size/layout computation derived from inner->f_3e and
 * either inner->f_188's zero-ness or inner->f_f8's value.
 */
extern void *func_0209dbb4(void);
extern int func_0209da94(int a0, int a1, int a2);
extern void func_020927e4(void *addr, int len);

typedef struct {
    unsigned char pad_4[4];
    char *inner;
} func_0209e628_Obj;

int func_0209e534(void) {
    func_0209e628_Obj *obj = (func_0209e628_Obj *)func_0209dbb4();
    int isZero;
    unsigned short f3e;

    if (func_0209da94(2, 7, 8) != 0) {
        return 0;
    }

    func_020927e4(obj->inner + 0xc, 4);

    if (*(int *)(obj->inner + 0xc) == 1) {
        return 0;
    }

    func_020927e4(obj->inner + 0x188, 2);

    isZero = (*(unsigned short *)(obj->inner + 0x188) == 0);

    func_020927e4(obj->inner + 0x3e, 2);

    f3e = *(unsigned short *)(obj->inner + 0x3e);

    if (isZero != 1) {
        return ((f3e + 0x51) & ~0x1f) << 1;
    }

    func_020927e4(obj->inner + 0xf8, 2);

    return (((f3e + 0xc) * (*(unsigned short *)(obj->inner + 0xf8)) + 0x29) & ~0x1f) << 1;
}
