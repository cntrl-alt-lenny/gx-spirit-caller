/* func_0203e868: 64-bit "elapsed since field_cb0" delta, shifted left 6
 * and hashed via func_020b3714 (2-word arg + 2-word return, both real
 * 64-bit values per ARM EABI) — read obj->field_cb0 INLINE in the same
 * expression as the func_02092fc8() call (not into a separate local),
 * or mwcc keeps it live across the call in extra callee-saved registers
 * the target never uses. If the hash's unsigned 64-bit value is small,
 * bail returning 3 (shared via goto with the tail's own return 3 — a
 * plain duplicate "return 3;" gets if-converted instead of branching).
 * Otherwise bump a saturating signed counter (field_d11, volatile —
 * needs a genuine re-read per C-73, not CSE'd); >=0xd hands off to
 * func_0203e4f0, otherwise resets field_cb0 and notifies func_0203e384. */
typedef struct {
    char                  pad_cb0[0xcb0];
    long long             field_cb0;  /* +0xcb0..0xcb7 */
    char                  pad_d11[0xd11 - 0xcb8];
    volatile signed char  field_d11;  /* +0xd11 */
} Obj0203e8b8;

extern long long func_02092fc8(void);
extern long long func_020b3714(int lo, int hi, unsigned int c, int d);
extern int        func_0203e4f0(void *p, int a1);
extern void       func_0203e384(int a0, int a1, int a2, int a3);
extern char       data_020bed78[];

int func_0203e868(Obj0203e8b8 *obj) {
    long long diff = (func_02092fc8() - obj->field_cb0) << 6;
    if ((unsigned long long)func_020b3714((int)diff, (int)(diff >> 32), 0x82ea, 0) < 0x12c) {
        goto ret3;
    }
    obj->field_d11 = obj->field_d11 + 2;
    if (obj->field_d11 >= 0xd) {
        return func_0203e4f0(obj, 3);
    }
    obj->field_cb0 = func_02092fc8();
    func_0203e384((int)(data_020bed78 + 0x10), (int)(data_020bed78 + 0x18), obj->field_d11, 0x200000);
ret3:
    return 3;
}
