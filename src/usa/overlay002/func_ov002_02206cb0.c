/* func_ov002_02206cb0: ability-gated slot lookup. self->f4 bits[6:14] is
 * an ability id passed to func_ov002_021ca4dc; self->f2 bits[6:11] must be
 * type 0x16 or 0x1b. self->f_14 is a packed Ov002Slot word validated
 * against self->f2's player bit plus 4 more field checks, then its
 * slot_id (bits 0-8) indexes data_ov002_022d0170 for a 13-bit node id
 * passed to func_0202df24.
 *
 * Bit positions re-derived directly from the lsl/lsr shift amounts in
 * the .s (not copied from the campaign dossier's prose, which had two
 * off-by-N errors: ability is bits 6-14 not 9-15, slot_idx is bits
 * 10-13 not 12-15).
 */
typedef struct {
    unsigned short player : 1;  /* bit 0 */
    unsigned short pad1_5 : 5;  /* bits 1-5 */
    unsigned short type   : 6;  /* bits 6-11 */
    unsigned short pad12  : 4;  /* bits 12-15 */
} F2Word;

typedef struct {
    unsigned short pad0    : 6;  /* bits 0-5 */
    unsigned short ability : 9;  /* bits 6-14 */
    unsigned short pad15   : 1;  /* bit 15 */
} F4Word;

typedef struct {
    unsigned int slot_id   : 9;  /* bits 0-8 */
    unsigned int player    : 1;  /* bit 9 */
    unsigned int slot_idx  : 4;  /* bits 10-13 */
    unsigned int pad14     : 1;  /* bit 14 */
    unsigned int live_flag : 1;  /* bit 15 */
    unsigned int pad16_18  : 3;  /* bits 16-18 */
    unsigned int sub_type  : 4;  /* bits 19-22 */
    unsigned int occ_flag  : 1;  /* bit 23 */
    unsigned int pad24_31  : 8;  /* bits 24-31 */
} F14Word;

typedef struct {
    char    pad0[2];
    F2Word  f2;    /* +0x2 */
    F4Word  f4;    /* +0x4 */
    char    pad6[0x14 - 6];
    F14Word f14;   /* +0x14 */
} Self02206da0;

struct Ov002Slot0250 { unsigned short id : 13; unsigned short _pad : 3; };

extern char data_ov002_022d0170[];

extern int func_ov002_021ca4dc(int ability);
extern int func_0202df24(int id, int code);

int func_ov002_02206cb0(Self02206da0 *self)
{
    if (!func_ov002_021ca4dc(self->f4.ability)) {
        return 0;
    }

    if (self->f2.type != 0x16 && self->f2.type != 0x1b) {
        goto fail;
    }

    if (self->f14.player != self->f2.player) {
        goto fail;
    }
    if (self->f14.slot_idx > 4) {
        goto fail;
    }
    if (self->f14.occ_flag != 0) {
        goto fail;
    }
    if (self->f14.live_flag == 0) {
        goto fail;
    }
    if (self->f14.sub_type != 0xe) {
        goto fail;
    }

    {
        struct Ov002Slot0250 *node =
            (struct Ov002Slot0250 *)(data_ov002_022d0170 + self->f14.slot_id * 4);
        return func_0202df24(node->id, 0x1691);
    }

fail:
    return 0;
}
