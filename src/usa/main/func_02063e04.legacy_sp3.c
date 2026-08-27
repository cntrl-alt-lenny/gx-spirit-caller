/* func_02063e04: if self->field_c==1, set state 5 and dispatch a 3-zero
 * call; else dispatch the plain self-only path. Both booleanize. */

typedef struct {
    char _pad_c[0xc];
    int field_c;
} Obj02063e78;

extern int func_02064364(void *self);
extern int func_02061be8(void *self, int a, int b, int c);

int func_02063e04(Obj02063e78 *self) {
    if (self->field_c == 1) goto L_200;

    return func_02064364(self) != 0;

L_200:
    self->field_c = 5;
    return func_02061be8(self, 0, 0, 0) != 0;
}
