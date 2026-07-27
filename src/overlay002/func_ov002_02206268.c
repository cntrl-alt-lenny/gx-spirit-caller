/* func_ov002_02206268: state-machine step; two guarded
 * func_ov002_022577dc checks around a func_ov002_021ff3bc call. */
typedef unsigned short u16;
struct S02206268 { short pad0; u16 bit0 : 1; u16 rest : 15; char pad4[8]; short state; };
extern int func_ov002_021bd030(int bit0);
extern int func_ov002_022577dc(struct S02206268 *self);
extern int func_ov002_021ff3bc(struct S02206268 *self, int arg1);

int func_ov002_02206268(struct S02206268 *self, int arg1) {
    self->state = 1;
    if (func_ov002_021bd030(self->bit0) >= 0) {
        if (func_ov002_022577dc(self) != 0) return 2;
    }
    self->state = 2;
    if (func_ov002_021ff3bc(self, arg1) != 0) {
        if (func_ov002_022577dc(self) != 0) return 2;
    }
    return 0;
}
