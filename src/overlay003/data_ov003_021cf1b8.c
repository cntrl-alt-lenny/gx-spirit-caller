/* data_ov003_021cf1b8 (32 bytes, 4-aligned): retyped from opaque bytes to
 * a 5-element {u16 x,y; u8 w,h} rect table + 2 trailing pad bytes as part
 * of cm-data-inference-8. Two consumers (func_ov003_021cc8b8.s elements
 * 0-2, func_ov003_021cca88.s elements 3-4, both `base + idx*6` computed-
 * stride with real loop bounds) together prove exactly 5 records; the
 * {u16,u16,u8,u8} field layout independently matches the already-matched
 * sibling functions func_ov003_021cefec.c/func_ov003_021cf064.c, which
 * define the rect struct they receive at that same 6-byte stride. Trailing
 * 2 zero bytes (offset 0x1e-0x1f) are unreferenced by either consumer --
 * ordinary 4-byte alignment padding to the next symbol, not a 6th record.
 * Kept non-const, matching the symbol's own prior non-const declaration
 * (.data ground truth).
 */

typedef struct {
    unsigned short x;
    unsigned short y;
    unsigned char  w;
    unsigned char  h;
} Rect021cf1b8;

struct {
    Rect021cf1b8 items[5];
    unsigned char pad[2];
} data_ov003_021cf1b8 = {
    {
        { 0x0058, 0x0088, 0x30, 0x30 },
        { 0x0090, 0x0088, 0x30, 0x30 },
        { 0x00c8, 0x0088, 0x30, 0x30 },
        { 0x0066, 0x0091, 0xba, 0x15 },
        { 0x0066, 0x00a9, 0xba, 0x15 },
    },
    { 0x00, 0x00 },
};
