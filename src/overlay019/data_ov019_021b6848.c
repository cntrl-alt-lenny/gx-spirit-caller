/* Ov019EditRecord: a double-buffer "staged commit" unit. `handle`/`aux`
 * each point at a small block whose own first field is an `unsigned
 * short` live count -- independently proven twice (func_0201ef3c.c's
 * state_0201ef3c_t and func_0201f090.c's list_f090 are the same shape,
 * decompiled separately). `tasks[19]` is walked for `handle`'s count
 * entries and invoked via Task_InvokeLocked (func_0201ef3c.c);
 * `pending[2]` is a 2-slot "commit queued" pair -- non-NULL slot 0 gates
 * the guarded-commit path (func_ov019_021b49bc.c / func_ov019_021b4fdc.s),
 * both slots get invoked then NULLed once flushed.
 */
typedef struct {
    void *handle;       /* +0x00 */
    void *aux;           /* +0x04 */
    void *tasks[19];      /* +0x08 */
    void *pending[2];      /* +0x54 */
} Ov019EditRecord;          /* 0x5c (92) bytes */

/* Ov019SceneBState: scene-B's controller (ov019_core.h). Two identically
 * shaped Ov019EditRecords -- func_ov019_021b49bc.c (matched) and
 * func_ov019_021b4fdc.s both drive record[0] at +0x0 and record[1] at
 * +0x5c through byte-identical logic -- plus a fade/slide/count tail
 * that drives a "displayed count changed" animation: func_ov019_021b3cf0.s
 * and func_ov019_021b2ae8.s both perform the same 3-field transaction
 * (count = new value, fade_flag = 1, slide_offset = -128) when the live
 * count differs from the cached one; func_ov019_021b4c30.c then runs the
 * fade (func_ov019_021b4c74.s) while fade_flag is set, then the slide
 * (func_ov019_021b4fdc.s) while slide_flag is set, clamp-advancing
 * slide_offset by +0x10/frame up to 0x50.
 */
typedef struct {
    Ov019EditRecord records[2]; /* +0x00 */
    int  fade_flag;             /* +0xb8 */
    int  slide_flag;            /* +0xbc */
    int  count;                 /* +0xc0: also func_ov019_021b4f1c's jump-table selector */
    int  slide_offset;          /* +0xc4 */
    char pad_c8[4];             /* +0xc8: unconfirmed, true gap */
} Ov019SceneBState;

Ov019SceneBState data_ov019_021b6848;
