/* func_ov002_022869d0: player=1-self->b0; if self->h16 (signed) >= cf16c
 * row[player] return 1; else return h14 >= h16 (unsigned). */

typedef unsigned short u16;

struct self_t { char _p0[2]; u16 b0 : 1; u16 _r : 15; char _p4[0x10]; u16 h14; u16 h16; };

extern char data_ov002_022cf16c[];

int func_ov002_022869d0(struct self_t *self)
{
    int player = 1 - self->b0;
    int limit = *(int *)(data_ov002_022cf16c + (player & 1) * 0x868);

    if ((int)self->h16 >= limit)
        return 1;
    return self->h14 >= self->h16;
}
