/* data_ov015_021b5a8c -- single 30-field struct instance (60 bytes).
 *
 * 3 independent, genuine consumers (Ov015_DrawScrollbarThumb,
 * Ov015_LoadCardList, and an unmatched sibling), all fixed-offset
 * (single-instance access, not an array), together covering all 30
 * u16 fields with zero gaps and zero overlap -- the same "exhaustive
 * multi-consumer coverage" bar this campaign used for the already-
 * shipped data_021015e4/data_020bec8c singleton structs. Field +0x04
 * confirmed as a {x,y,w,h} rect by a prior retriage note plus
 * centering-math in its consumer. See docs/queue/claude-scaffolder.md
 * (cm-data-inference-5).
 */

typedef struct {
    unsigned short field_00, field_02;                     /* +0x00 -- func_ov015_021b4ba0.s:185-193 */
    unsigned short rect_x, rect_y, rect_w, rect_h;          /* +0x04 -- func_ov015_021b3d2c.s:28-35 */
    unsigned short field_0c, field_0e, field_10, field_12;  /* +0x0c -- func_ov015_021b4ba0.s:210-221 */
    unsigned short field_14, field_16, field_18, field_1a;  /* +0x14 -- func_ov015_021b47cc.s:247-259 */
    unsigned short field_1c, field_1e, field_20, field_22;  /* +0x1c -- func_ov015_021b4ba0.s:247-259 */
    unsigned short group_24[6];                             /* +0x24 -- func_ov015_021b4ba0.s:111-118 */
    unsigned short group_30[6];                             /* +0x30 -- func_ov015_021b4ba0.s:144-160 */
} Ov015_021b5a8c;

const Ov015_021b5a8c data_ov015_021b5a8c = {
    .field_00 = 0x0000, .field_02 = 0x0001,
    .rect_x = 0x0000, .rect_y = 0x0000, .rect_w = 0x0020, .rect_h = 0x0018,
    .field_0c = 0x0007, .field_0e = 0x0024, .field_10 = 0x00e0, .field_12 = 0x00bb,
    .field_14 = 0x000c, .field_16 = 0x0024, .field_18 = 0x00dc, .field_1a = 0x00bb,
    .field_1c = 0x0000, .field_1e = 0x0001, .field_20 = 0x001c, .field_22 = 0x0002,
    .group_24 = { 0x0014, 0x0014, 0x0013, 0x0014, 0x0018, 0x0018 },
    .group_30 = { 0x0002, 0x0003, 0x0004, 0x0005, 0x0006, 0x0007 },
};
