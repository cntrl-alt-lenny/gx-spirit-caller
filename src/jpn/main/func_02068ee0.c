/* func_02068ee0: C-42 — 3-helper void thunk with struct offset.
 *
 *   push {r4, lr}; mov r4, r0
 *   add r0, r4, #76; bl func_0206a9bc   ; (&self + 76)
 *   mov r0, r4; bl func_02068058        ; (self)
 *   mov r0, r4; bl func_02045364        ; (self)
 *   pop
 */

struct F02068f54 {
    char pad[76];
    char sub[1];  /* substruct at offset 76 */
};

extern void func_0206a9bc(void *p);
extern void func_02068058(struct F02068f54 *self);
extern void func_02045364(struct F02068f54 *self);

void func_02068ee0(struct F02068f54 *self) {
    func_0206a9bc(self->sub);
    func_02068058(self);
    func_02045364(self);
}
