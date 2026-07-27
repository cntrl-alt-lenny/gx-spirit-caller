/* func_ov002_0220c980: kind==0x23 or (per-player cf288 word's bit18 clear)
 * -> return 1 (shared goto), else 0. */

typedef unsigned short u16;
typedef unsigned int   u32;

struct Self980 {
    u16 f0;
    u16 b0   : 1;
    u16      : 5;
    u16 kind : 6;
    u16      : 4;
};

extern char data_ov002_022cf288[];

int func_ov002_0220c980(struct Self980 *self)
{
    if (self->kind == 0x23)
        goto ret1;
    if ((*(u32 *)(data_ov002_022cf288 + (self->b0 & 1) * 0x868) >> 0x12) & 1)
        return 0;
ret1:
    return 1;
}
