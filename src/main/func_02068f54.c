/* func_02068f54: C-42 — 3-helper void thunk with struct offset.
 *
 *   push {r4, lr}; mov r4, r0
 *   add r0, r4, #76; bl func_0206aa30   ; (&self + 76)
 *   mov r0, r4; bl func_020680cc        ; (self)
 *   mov r0, r4; bl func_020453b4        ; (self)
 *   pop
 */

struct F02068f54 {
    char pad[76];
    char sub[1];  /* substruct at offset 76 */
};

extern void func_0206aa30(void *p);
extern void func_020680cc(struct F02068f54 *self);
extern void func_020453b4(struct F02068f54 *self);

void func_02068f54(struct F02068f54 *self) {
    func_0206aa30(self->sub);
    func_020680cc(self);
    func_020453b4(self);
}
