/* func_02065714: fetch the singleton; if present and its handle isn't
 * already "released" (-1), release it, then mark released + set
 * field_10 = 4. */

extern void *func_02065f34(void);
extern void func_02054dfc(void *handle);

typedef struct {
    void *f0;          /* +0x0 */
    char _pad_10[0x10 - 0x4];
    int field_10;        /* +0x10 */
} Obj02065788;

void func_02065714(void) {
    Obj02065788 *self = func_02065f34();
    if (self == 0) return;

    if (self->f0 != (void *)-1) {
        func_02054dfc(self->f0);
    }
    self->f0 = (void *)-1;
    self->field_10 = 4;
}
