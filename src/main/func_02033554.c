/* func_02033554: dense 8-way (0-7) state dispatch (all cases listed to
 * force jump-table lowering per C-87), most falling straight through;
 * state 3 and 6 run extra teardown calls. Always clears state afterward. */
typedef struct Obj02033554 {
    char pad_e80[0xe80];
    int  f_e80;
    int  f_e84;
    int  f_e88;  /* state, +0xe88 */
} Obj02033554;

extern void func_02033488(void *p);
extern void func_020334b4(void *p);
extern void func_0204529c(void);

void func_02033554(Obj02033554 *obj) {
    switch (obj->f_e88) {
    case 0:
    case 1:
    case 2:
        break;
    case 3:
        func_02033488(obj);
        break;
    case 4:
    case 5:
        break;
    case 6:
        func_02033488(obj);
        func_020334b4(obj);
        break;
    case 7:
        break;
    }
    obj->f_e80 = 0;
    obj->f_e84 = 0;
    obj->f_e88 = 0;
    func_0204529c();
}
