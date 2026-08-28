/* func_ov002_0220d468: gates on two predicate calls fed self->flag0
 * (twice) and a 5-bit field (self->f2 bits 5:1), then a PerPlayerRowTable
 * event-count gate keyed by flag0, finally dispatching func_ov002_021ff2cc.
 */

typedef unsigned short u16;

struct Self0220d558 {
    u16 f0;
    u16 flag0 : 1;
    u16 field5 : 5;
    u16 _restpad : 10;
};

extern int func_ov002_021bc7e8(int a, int b, int field5);
extern int func_ov002_021b9d68(int flag0, int field5);
extern int func_ov002_021ff2cc(struct Self0220d558 *self, int arg1);
extern char data_ov002_022cf09c[];

int func_ov002_0220d468(struct Self0220d558 *self, int arg1)
{
    if (func_ov002_021bc7e8(self->flag0, self->flag0, self->field5) == 0) return 0;
    if (func_ov002_021b9d68(self->flag0, self->field5) == 0) return 0;

    int off = (self->flag0 & 1) * 0x868;
    if (*(int *)(data_ov002_022cf09c + off) == 0) return 0;

    return func_ov002_021ff2cc(self, arg1);
}
