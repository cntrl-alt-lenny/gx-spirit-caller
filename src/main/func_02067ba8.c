/* func_02067ba8: if field_10 nonzero, run a fixed teardown sequence
 * (dismiss, close, maybe cancel), then if field_10 became 0 fire the
 * indirect callback at field_44(self, 2, 0, field_48). */

typedef struct Obj02067ba8 Obj02067ba8;
typedef void (*Cb02067ba8)(Obj02067ba8 *, int, int, int);

struct Obj02067ba8 {
    char _pad_10[0x10];
    int field_10;             /* +0x10 */
    char _pad_1c[0x1c - 0x14];
    int field_1c;              /* +0x1c */
    char _pad_44[0x44 - 0x20];
    Cb02067ba8 field_44;        /* +0x44 */
    int field_48;                /* +0x48 */
};

extern void func_02067ce8(Obj02067ba8 *self, int zero);
extern void func_02067c58(Obj02067ba8 *self);
extern void func_02067c08(Obj02067ba8 *self);

void func_02067ba8(Obj02067ba8 *self) {
    if (self->field_10 == 0) return;

    func_02067ce8(self, 0);
    func_02067c58(self);

    if (self->field_1c > 0) {
        func_02067c08(self);
    }

    if (self->field_10 != 0) return;

    self->field_44(self, 2, 0, self->field_48);
}
