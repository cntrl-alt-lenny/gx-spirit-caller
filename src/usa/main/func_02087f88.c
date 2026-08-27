/* func_02087f88: sibling of func_020880c8 -- if a0's bit1 flag is set,
 * mask/unmask via func_02094f3c(field_44, 0, 1<<field_40, 0) and run
 * a result/dispatch/consume triple. See func_020880c8.legacy_sp3.c
 * for the sibling this shape is drawn from. */

extern void func_02094f3c(void *field44, int zero1, int mask, int zero2);
extern int func_020954b4(void);
extern void func_02095584(int a0);
extern void func_020954f4(int a0);

typedef struct {
    unsigned char _pad_00[0x24];
    int flags;
    unsigned char _pad_28[0x18];
    int field_40;
    void *field_44;
} Obj_02088070_t;

void func_02087f88(Obj_02088070_t *a0) {
    if ((int)(a0->flags << 30) >> 31) {
        int mask = 1 << a0->field_40;
        int result;
        func_02094f3c(a0->field_44, 0, mask, 0);
        result = func_020954b4();
        func_02095584(1);
        func_020954f4(result);
    }
}
