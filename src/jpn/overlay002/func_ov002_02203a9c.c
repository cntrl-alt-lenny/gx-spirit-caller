/* func_ov002_02203a9c (ov002): player=self->b0; guard via 021ca698(player,
 * player); pick found = 021b3ecc(player,0xb,0x14a0)!=0 ? 021bbf50(player)
 * : 021c325c(player); if found==0, go to tail. Else scan p=0..1, s=0..4:
 * two independent walking pointers per player row (stride 0x14, +0x30
 * apart - same shape as func_ov002_022858d8): "row"(id, bitfield:13) and
 * "other"(f_0e at +0x38 rel. to itself = slot+8). If id && f_0e &&
 * cmp_val (=021c84e0(p,s)) and cmp_val<=found, return 2.
 * Tail: mode (2-bit field at offset 12 of self->f2) ==3 ? 0 : 3. */
typedef unsigned short u16;

typedef struct {
    u16 f0;
    u16 b0 : 1;
    u16 _pad1 : 11;
    u16 mode : 2;
    u16 _pad2 : 2;
} Self02203b8c;

struct Slot02203b8c { unsigned int id : 13; };

extern char data_ov002_022cf08c[];
extern int func_ov002_021ca5b8(int a, int b);
extern int func_ov002_021b3dec(int a, int b, int c);
extern int func_ov002_021bbe70(int a);
extern int func_ov002_021c317c(int a);
extern int func_ov002_021c8400(int p, int s);

int func_ov002_02203a9c(Self02203b8c *self)
{
    int found;
    int p, s;

    if (!func_ov002_021ca5b8(self->b0, self->b0))
        goto tail;

    if (func_ov002_021b3dec(self->b0, 0xb, 0x14a0) != 0)
        found = func_ov002_021bbe70(self->b0);
    else
        found = func_ov002_021c317c(self->b0);

    if (found == 0)
        goto tail;

    for (p = 0; p < 2; p++) {
        char *row = data_ov002_022cf08c + (p & 1) * 0x868;
        struct Slot02203b8c *slot = (struct Slot02203b8c *)(row + 0x30);
        char *other = row;

        for (s = 0; s < 5; s++, slot = (struct Slot02203b8c *)((char *)slot + 0x14), other += 0x14) {
            int cmp_val = func_ov002_021c8400(p, s);
            unsigned int id = slot->id;
            unsigned short f_0e;

            if (id != 0) {
                f_0e = *(unsigned short *)(other + 0x38);
                if (f_0e != 0 && cmp_val != 0) {
                    if (cmp_val <= found)
                        return 2;
                }
            }
        }
    }

tail:
    return (self->mode == 3) ? 0 : 3;
}
