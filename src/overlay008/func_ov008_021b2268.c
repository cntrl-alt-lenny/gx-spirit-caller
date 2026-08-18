/* func_ov008_021b2268: guard on (a0,a1) already applied to the global
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

extern Ov008Obj *data_ov008_021b270c;
extern int func_02021660(int a, int b, int c);
extern void func_020216b0(int a, int b, int c);
extern void OS_SPrintf(void *out, void *fmt, int val);
extern char data_ov008_021b275c[];

void func_ov008_021b2268(int a0, int a1) {
    int h;

    if (a0 == data_ov008_021b270c->field_c && a1 == 0) return;

    data_ov008_021b270c->field_c = a0;
    h = func_02021660(data_ov008_021b270c->field_4, 3, 2);
    func_020216b0(h, 2, 0x29);
    func_020216b0(h, 0, 0x41);

    OS_SPrintf(data_ov008_021b270c->buf_70, data_ov008_021b275c,
               data_ov008_021b270c->field_c);
}
