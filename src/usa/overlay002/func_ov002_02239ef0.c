#include "ov002_core.h"

typedef struct {
    int f0;
    int f4;
    char pad8[4];
    int fc;
} Row420;

struct SlotExtra {
    unsigned int _pad0 : 13;   /* id, unused here */
    unsigned int flagBit : 1;  /* bit 13 */
    unsigned int _pad1 : 8;    /* bits 14-21 */
    unsigned int field8 : 8;   /* bits 22-29 */
    unsigned int _pad2 : 2;    /* bits 30-31 */
};

extern char data_ov002_022cd340[];
extern int func_ov002_021b3538(int player, int idx);
extern void func_ov002_021de3c0(struct Ov002Self *self, int a, int b);

int func_ov002_02239ef0(struct Ov002Self *self)
{
    unsigned short raw = *(unsigned short *)((char *)self + 2);
    unsigned int field = (unsigned int)(raw << 26) >> 27;
    Row420 *row_a = (Row420 *)(data_ov002_022cd340 + D016C->f_cec * 0x38);
    Row420 *row_b = (Row420 *)(data_ov002_022cd340 + (1 - D016C->f_cec) * 0x38);
    int result;

    result = func_ov002_021b3538(self->b0, field);

    if (*(int *)(data_ov002_022cd314 + 8) != 0)
        return 0;

    {
        unsigned int packed = (unsigned char)row_a->f0 | ((unsigned char)row_a->f4 << 8);
        if (result != (unsigned short)packed) {
            int player_off = (row_a->f0 & 1) * 0x868;
            char *row_base = (char *)data_ov002_022cf08c + player_off + 0x30;
            struct SlotExtra *slot = (struct SlotExtra *)(row_base + row_a->f4 * 20);
            if (row_a->fc == slot->flagBit + (slot->field8 << 1)) {
                func_ov002_021de3c0(self, row_a->f0, row_a->f4);
            }
        }
    }
    {
        unsigned int packed = (unsigned char)row_b->f0 | ((unsigned char)row_b->f4 << 8);
        if (result != (unsigned short)packed) {
            int player_off = (row_b->f0 & 1) * 0x868;
            char *row_base = (char *)data_ov002_022cf08c + player_off + 0x30;
            struct SlotExtra *slot = (struct SlotExtra *)(row_base + row_b->f4 * 20);
            if (row_b->fc == slot->flagBit + (slot->field8 << 1)) {
                func_ov002_021de3c0(self, row_b->f0, row_b->f4);
            }
        }
    }
    return 0;
}
