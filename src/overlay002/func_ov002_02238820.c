/* func_ov002_02238820: C-39f self-consumed — helper(1-bit0, (v+1)>>1); return 0. */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf16c[];
extern void func_ov002_021df73c(int a, int b);
int func_ov002_02238820(struct S *self) {
    int v = *(int *)(data_ov002_022cf16c + ((1 - self->bit0) & 1) * 0x868);
    func_ov002_021df73c(1 - self->bit0, (v + 1) >> 1);
    return 0;
}
