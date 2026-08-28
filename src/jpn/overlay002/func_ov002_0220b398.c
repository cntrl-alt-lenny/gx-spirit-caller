/* func_ov002_0220b398 (ov002).
 *
 * Guard chain on item->id / item->f2 bitfields, then forwards a
 * derived (player, 1, filt, mapped) tuple to func_ov002_021fef30, and
 * finally scans item's slot list (via func_ov002_0223dda4) for a slot
 * whose (bit0, field5) pair matches self->f2's (player, field5) pair.
 *
 * Struct-offset provenance:
 *  - ItemT (r5 / param2) offset 0x0 (u16 id), 0x2 (u16 bitfields: bit0
 *    unused-here / field5 = bits1-5 / field2 = bits12-13) match the
 *    already-shipped sibling struct `Card021c1e44` in
 *    src/overlay002/func_ov002_021c1e44.c bit-for-bit (same bit0:1,
 *    field:5 layout at the same struct offset, same [5,0xa) range-check
 *    idiom against the SAME callee, func_0202e1e0). offset 0x6 (u16,
 *    low byte = loop count) is local to this function.
 *  - SelfT (r6 / param1) offset 0x2 (bit0 "player" + bits1-5 "field5")
 *    matches struct Func021ff320F2/Func021ff320Self in
 *    src/overlay002/func_ov002_021ff230.c exactly (same self pointer,
 *    passed to that very function below). offset 0x4 bits6-14 (9-bit
 *    "filt" field) is local to this function; range 0-511 matches the
 *    "addr" value (byte_fld + bit18, max 0x1ff) computed inside
 *    func_ov002_021fef30 per docs/research/dossiers/021ff020.md.
 *
 * Callee signature notes:
 *  - func_0202de48 and func_ov002_021ff230 are each called here with
 *    one MORE argument than their own shipped definitions declare
 *    (src/main/func_0202de48.c: `int func_0202de48(void)`;
 *    src/overlay002/func_ov002_021ff230.c: `int
 *    func_ov002_021ff230(struct Func021ff320Self *self)`). The extra
 *    argument-setup instructions (`ldrh r0,[r5]` / `mov r1,r5`) are
 *    present in THIS function's own disassembly immediately before
 *    each `bl`, so this TU's local prototypes are widened to match
 *    what the caller actually sets up. Precedent for exactly this
 *    pattern already exists in the tree:
 *    src/overlay002/func_ov002_021b90a8.c declares and calls
 *    `func_0202de48(v)` with one int argument. The extra argument is
 *    simply unused/dead inside the real callee body (separate TU, no
 *    shared header, so no prototype-mismatch compile error).
 */

typedef unsigned short u16;
typedef unsigned char u8;

typedef struct {
    u16 f0;                 /* +0x0, unused in this function */
    struct {
        u16 player : 1;      /* +0x2 bit0 */
        u16 field5 : 5;      /* +0x2 bits1-5 */
        u16 _pad0  : 10;
    } f2;                    /* +0x2 */
    struct {
        u16 _pad0 : 6;
        u16 filt   : 9;       /* +0x4 bits6-14 */
        u16 _pad1  : 1;
    } f4;                    /* +0x4 */
} SelfT;

typedef struct {
    u16 id;                  /* +0x0 */
    struct {
        u16 _pad0  : 1;        /* +0x2 bit0, unused in this function */
        u16 field5 : 5;        /* +0x2 bits1-5 */
        u16 _pad1  : 6;
        u16 field2 : 2;        /* +0x2 bits12-13 */
        u16 _pad2  : 2;
    } f2;                     /* +0x2 */
    char _pad4[2];             /* +0x4, unused in this function */
    u16 f6;                    /* +0x6, low byte = loop count */
} ItemT;

extern int IsValue12D3Or147E(int a0);
extern int func_0202e1e0(int x);
extern int func_0202de48(int id);
extern int func_ov002_021ff230(SelfT *a0, ItemT *a1);
extern int func_ov002_021fef30(int a, int b, int c, int d);
extern u16 func_ov002_0223dda4(void *node, int idx);

int func_ov002_0220b398(SelfT *self, ItemT *item)
{
    int mapped;
    int i;
    u16 got;
    u16 want;

    if (item == 0)
        return 0;
    if (IsValue12D3Or147E(item->id) != 0)
        return 0;
    if (func_ov002_021ff230(self, item) == 0)
        return 0;

    if (func_0202e1e0(item->id) == 0)
        goto check_field2;
    if (item->f2.field5 < 5)
        goto after_guard;
    if (item->f2.field5 > 0xa)
        goto after_guard;
check_field2:
    if (item->f2.field2 != 0)
        return 0;
after_guard:
    mapped = func_0202de48(item->id);
    if (func_0202e1e0(item->id) != 0) {
        if (item->f2.field5 >= 5 && item->f2.field5 <= 0xa)
            mapped = 7;
    }

    if (func_ov002_021fef30(self->f2.player, 1, self->f4.filt, mapped) == 0)
        return 0;

    for (i = 0; i < (int)((unsigned int)(item->f6 << 24) >> 24); i++) {
        got = func_ov002_0223dda4(item, i);
        want = (u16)((u8)self->f2.player | ((u8)self->f2.field5 << 8));
        if (got == want)
            return 1;
    }
    return 0;
}
