/* func_02062254: if self->field_c == 4, run a param-mutating callback
 * pair and mark state 6; otherwise no-op. */

typedef struct {
    char _pad_c[0xc];
    int field_c;   /* +0xc */
    char _pad_14[0x14 - 0x10];
    int field_14;  /* +0x14 */
} Obj020622c8;

extern void func_02064d3c(int *out1, int *out2);
extern void func_02062b30(Obj020622c8 *self, int a, int b);

void func_02062254(Obj020622c8 *self, int p1, int p2, int p3) {
    self->field_14 = 0;
    if (self->field_c != 4) return;

    func_02064d3c(&p1, &p2);
    func_02062b30(self, p1, p2);
    self->field_c = 6;
}
