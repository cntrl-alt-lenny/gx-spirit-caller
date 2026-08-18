/* func_02088070: sibling of func_020881b0 -- if a0's bit1 flag is set,
 * mask/unmask via func_02095030(field_44, 0, 1<<field_40, 0) and run
 * a result/dispatch/consume triple. See func_020881b0.legacy_sp3.c
 * for the sibling this shape is drawn from. */

extern void func_02095030(void *field44, int zero1, int mask, int zero2);
extern int func_020955a8(void);
extern void func_02095678(int a0);
extern void func_020955e8(int a0);

typedef struct {
    unsigned char _pad_00[0x24];
    int flags;
    unsigned char _pad_28[0x18];
    int field_40;
    void *field_44;
} Obj_02088070_t;

void func_02088070(Obj_02088070_t *a0) {
    if ((int)(a0->flags << 30) >> 31) {
        int mask = 1 << a0->field_40;
        int result;
        func_02095030(a0->field_44, 0, mask, 0);
        result = func_020955a8();
        func_02095678(1);
        func_020955e8(result);
    }
}
