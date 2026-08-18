/* func_02038c98: run func_0207d318's per-frame update; if flag is set,
 * dispatch on obj->f1e (8-way, all cases listed for jump-table lowering
 * per C-87) to gate func_020960ac/func_02096060 behind func_02089024;
 * always tail-forwards to func_0207d458. */
typedef struct Obj02038c98 {
    char          pad_14[0x14];
    int           f14;   /* +0x14 */
    char          pad_1e[0x1e - 0x18];
    unsigned char f1e;   /* +0x1e */
} Obj02038c98;

extern int  func_0207d318(void *p);
extern unsigned int func_02089024(unsigned int idx);
extern void func_020960ac(void *a);
extern void func_02096060(void *a);
extern int  data_0219b330;
extern int  func_0207d458(int a, void *b);

int func_02038c98(Obj02038c98 *obj, int flag) {
    func_0207d318(obj);
    if (flag != 0) {
        switch (obj->f1e) {
        case 0:
            break;
        case 1:
            if (func_02089024(obj->f14) != 0) {
                func_020960ac((char *)obj + 0x20);
            }
            break;
        case 3:
        case 4:
        case 5:
        case 6:
            break;
        case 2:
        case 7:
            if (func_02089024(obj->f14) != 0) {
                func_02096060((char *)obj + 0x20);
            }
            break;
        }
    }
    return func_0207d458(data_0219b330, obj);
}
