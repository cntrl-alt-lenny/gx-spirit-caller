typedef unsigned short u16;
typedef struct {
    u16 f_0;
    u16 f_2;
} Self02210104;
struct Arg { u16 id; u16 side:1; u16 rest:15; u16 low:2; u16 blocked:1; u16 high:13; };
struct State { char pad[0xf8]; unsigned int value:13; unsigned int rest:19; };
extern unsigned char data_ov002_022cf26c[];
extern unsigned char data_ov002_022cf16c[];
extern void func_ov002_021e276c(int self, int a, int b, int c);
extern int func_ov002_02210104(Self02210104 *self, int unused1);
int func_ov002_0222c3dc(struct Arg *self, int arg1) {
    int offset;
    func_ov002_021e276c(self->side, self->id, 1, 0);
    if (!self->blocked) {
        offset = (self->side & 1) * 0x868;
        if (*(u16 *)(data_ov002_022cf26c + offset) == 0) return 0;
        if (((struct State *)(data_ov002_022cf16c + offset))->value != 0x175e) return 0;
        return func_ov002_02210104((Self02210104 *)self, arg1);
    }
    return 0;
}
