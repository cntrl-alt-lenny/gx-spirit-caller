/* data_0210229c (8 bytes, 4-aligned): GX FIFO argument pair -- the
 * MTX_POP (opcode 0x12) and MTX_MODE (opcode 0x10) command parameters
 * for the twin GX-transform object handler func_02083718 (dispatch
 * table data_021022e0 slot 8; see data_021022e0.c). Mirrors
 * data_02102254 (func_02083aa8, dispatch slot 7) field-for-field and
 * byte-for-byte; see that file for the full GX-sequence writeup. Real
 * bytes decode to word0=1, word1=2 (identical to data_02102254's
 * content; independent storage).
 *
 * Consumer: src/main/func_02083718.s:188 (`ldr r0, _LIT8`, _LIT8 =
 * data_0210229c; second identical use at line 208). relocs.txt:
 * `from:0x02083a9c kind:load to:0x0210229c module:main`. Same GX FIFO
 * sequence as data_02102254: FIFO port 0x04000400 gets `0x00171012`
 * (packed MTX_POP, MTX_MODE, MTX_LOAD_4x3), then func_020944ec
 * (src/main/func_020944ec.c, matched) drains this struct's 2 words in
 * order as the MTX_POP arg (1: pop 1 matrix) and MTX_MODE arg (2:
 * POSITION_VECTOR).
 *
 * CROSS-REGION: no src/jpn/main or src/usa/main file of this name
 * exists (checked directly); EUR-only src/main/ TU, moot for build
 * safety per tools/configure.py's region-scoping rule.
 */

typedef struct {
    int pop_count;   /* +0x00 -- GX FIFO MTX_POP (opcode 0x12) arg */
    int mtx_mode;      /* +0x04 -- GX FIFO MTX_MODE (opcode 0x10) arg */
} GxMtxPopMode;

GxMtxPopMode data_0210229c = {
    1, 2,
};
