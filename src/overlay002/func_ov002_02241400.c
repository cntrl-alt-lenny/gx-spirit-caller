typedef unsigned short u16;
struct Self { u16 id; u16 player:1; u16 slot:5; u16 rest:10; };
struct State { char pad[0x5b8]; int state; };
struct Data { char pad[0xb0]; u16 value; };
struct S0223dad0;
extern struct State data_ov002_022ce288;
extern struct Data data_ov002_022d0e6c;
extern int func_ov002_021d90c0(int flag, int arg1, int arg2);
extern void func_ov002_0223dad0(struct S0223dad0 *self, unsigned short val);
extern void func_ov002_0226b0b0(int arg0, int arg1, int arg2);
/* The original supplies two arguments; the definition's third argument is unused. */
extern int func_ov002_0226b158();
int func_ov002_02241400(struct Self *self) {
    switch (data_ov002_022ce288.state) {
    case 0:
        func_ov002_0226b158(self->player, self->id);
        data_ov002_022ce288.state++;
        return 0;
    case 1:
        func_ov002_021d90c0(self->player, self->slot, data_ov002_022d0e6c.value);
        func_ov002_0223dad0((struct S0223dad0 *)self, data_ov002_022d0e6c.value);
        data_ov002_022ce288.state++;
        return 0;
    case 2:
        func_ov002_0226b0b0(1-self->player, 0x1357, data_ov002_022d0e6c.value);
        data_ov002_022ce288.state++;
        return 0;
    default: return 1;
    }
}
