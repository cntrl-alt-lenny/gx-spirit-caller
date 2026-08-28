/* func_02068f04: gate on (p6==0 && data_0219e310!=1); allocate a 0x638-byte
 * object via func_02045398, fill in f_630/f_634/f_624, then call
 * func_0206b2a8 and func_020680a8 with several trailing stack-passed args.
 */
typedef struct {
    char pad0[0x624];
    int f_624;
    char pad1[0x630 - 0x628];
    int f_630;
    int f_634;
} Obj;

extern int data_0219e310;

extern Obj *func_02045398(int size);
extern void func_0206b2a8(void *sub, void *self, int p1, int p2, int p3, int p6,
                           void (*fn)(void), Obj *obj);
extern void func_020680a8(Obj *obj, int p4, int p5, int p6, void (*fn)(void), Obj *obj2);
extern void func_02069088(void);
extern void func_02068fd8(void);

Obj *func_02068f04(void *self, int p1, int p2, int p3, int p4, int p5, int p6, int p7, int p8) {
    Obj *obj;

    if (p6 == 0) {
        if (data_0219e310 != 1) {
            return 0;
        }
    }
    obj = func_02045398(0x638);
    if (obj == 0) {
        return 0;
    }
    obj->f_630 = p7;
    obj->f_634 = p8;
    obj->f_624 = 0;

    func_0206b2a8((char *)obj + 0x4c, self, p1, p2, p3, p6, func_02069088, obj);
    func_020680a8(obj, p4, p5, p6, func_02068fd8, obj);

    return obj;
}
