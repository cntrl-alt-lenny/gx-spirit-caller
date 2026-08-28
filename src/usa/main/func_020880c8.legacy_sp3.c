/* func_020880c8: if a0's bit1 flag is set, run a small teardown sequence
 * (unmask/mask helper, two address-of calls, clear bit1, then a
 * result/dispatch/consume triple) before unconditionally calling
 * func_02088098(a0). */

extern void func_02094f3c(void *field44, int zero1, int mask, int zero2);
extern void func_0209a718(void *p);
extern void func_0209a700(void *p);
extern int func_020954b4(void);
extern void func_02095584(int a0);
extern void func_020954f4(int a0);
extern void func_02088098(void *a0);

typedef struct {
    unsigned char _pad_00[0x24];
    int flags;
    unsigned char _pad_28[0x18];
    int field_40;
    void *field_44;
} Obj_020881b0_t;

void func_020880c8(Obj_020881b0_t *a0) {
    if ((int)(a0->flags << 30) >> 31) {
        int mask = 1 << a0->field_40;
        int result;
        func_02094f3c(a0->field_44, 0, mask, 0);
        func_0209a718((char *)a0 + 0x8);
        func_0209a700((char *)a0 + 0x14);
        a0->flags &= ~2;
        result = func_020954b4();
        func_02095584(1);
        func_020954f4(result);
    }
    func_02088098(a0);
}
