/* func_ov002_02295c04: two guard queries (predicated early-return, same
 * return value 0) then a tail-call. */
struct S02295d14 { short pad0; unsigned short bit0 : 1; unsigned short rest : 15; };
extern int func_ov002_021bad9c(int player, int code, int arg);
extern int func_ov002_02291138(struct S02295d14 *self, int arg1);

int func_ov002_02295c04(struct S02295d14 *self, int arg1) {
    if (func_ov002_021bad9c(1 - self->bit0, 0x1614, -1) != 0) return 0;
    if (func_ov002_021bad9c(1 - self->bit0, 0x17c2, -1) != 0) return 0;
    return func_ov002_02291138(self, arg1);
}
