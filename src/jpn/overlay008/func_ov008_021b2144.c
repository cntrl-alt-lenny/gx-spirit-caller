/* func_ov008_021b2144: guard on (a0,a1) already applied to the global
 * obj's field_c; if not, apply it, open an OAM cell and push two
 * fields, then sprintf the new value into obj+0x70.
 */

typedef struct {
    char _pad0[4];
    int field_4;
    char _pad1[4];
    int field_c;
    char _pad2[0x70 - 0x10];
    char buf_70[1];
} Ov008Obj;

extern Ov008Obj *data_ov008_021b25ec;
extern int func_0202160c(int a, int b, int c);
extern void func_0202165c(int a, int b, int c);
extern void OS_SPrintf(void *out, void *fmt, int val);
extern char data_ov008_021b263c[];

void func_ov008_021b2144(int a0, int a1) {
    int h;

    if (a0 == data_ov008_021b25ec->field_c && a1 == 0) return;

    data_ov008_021b25ec->field_c = a0;
    h = func_0202160c(data_ov008_021b25ec->field_4, 3, 2);
    func_0202165c(h, 2, 0x29);
    func_0202165c(h, 0, 0x41);

    OS_SPrintf(data_ov008_021b25ec->buf_70, data_ov008_021b263c,
               data_ov008_021b25ec->field_c);
}
