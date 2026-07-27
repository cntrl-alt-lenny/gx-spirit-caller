/* func_ov002_02239934: result = 0221d288(self); if (ce288.f_5a8==0x7e)
 * self->flag_e = 1; if (result==0 && self->flag_e==0)
 * 021df818(self, self->b0, 0x7d0); return result. */

typedef unsigned short u16;

struct Self { u16 f0; u16 b0 : 1; u16 : 15; };

extern char data_ov002_022ce288[];
extern int func_ov002_0221d288(struct Self *self);
extern int func_ov002_021df818(struct Self *self, int bit0, int val);

int func_ov002_02239934(struct Self *self)
{
    int result;

    result = func_ov002_0221d288(self);
    if (*(int *)(data_ov002_022ce288 + 0x5a8) == 0x7e)
        *(u16 *)((char *)self + 0xe) = 1;
    if (result == 0 && *(u16 *)((char *)self + 0xe) == 0)
        func_ov002_021df818(self, self->b0, 0x7d0);
    return result;
}
