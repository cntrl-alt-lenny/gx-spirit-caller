/* data_02102254 (8 bytes, 4-aligned): GX FIFO argument pair -- the
 * MTX_POP (opcode 0x12) and MTX_MODE (opcode 0x10) command parameters
 * for one of two twin GX-transform object handlers reachable through
 * the func_02084dc0 dispatch table (data_021022e0, slot 7 ==
 * func_02083aa8; see data_021022e0.c). Real bytes decode to word0=1,
 * word1=2.
 *
 * Consumer: src/main/func_02083aa8.s:160 (`ldr r0, _LIT7`, _LIT7 =
 * data_02102254; second identical use at line 180). relocs.txt:
 * `from:0x02083dc8 kind:load to:0x02102254 module:main`. Immediately
 * before each use, `0x00171012` is written to the GX FIFO command port
 * (0x04000400, LIT3/LIT6 in that file) -- packed opcode bytes
 * [0x12, 0x10, 0x17, 0x00] LE, i.e. MTX_POP then MTX_MODE then
 * MTX_LOAD_4x3 then unused. func_020944ec (matched,
 * src/main/func_020944ec.c) then drains exactly 8 bytes (2 words) from
 * &data_02102254 straight into that port (fixed dest, incrementing
 * src) -- read in order as the MTX_POP arg (word0=1: pop 1 matrix,
 * bits 0-5 signed count) and the MTX_MODE arg (word1=2:
 * POSITION_VECTOR, standard NDS GX mode encoding 0=PROJECTION/
 * 1=POSITION/2=POSITION_VECTOR/3=TEXTURE). MTX_LOAD_4x3's following 12
 * params are drained separately (0x30 bytes) from a different,
 * non-static source (func_020820b8/func_02082198's return value), not
 * from this symbol.
 *
 * data_0210229c (src/main/data_0210229c.c) is the twin instance for
 * mirror handler func_02083718 (dispatch slot 8) -- byte-identical
 * initial content, independent storage.
 *
 * CROSS-REGION: no src/jpn/main or src/usa/main file of this name
 * exists (checked directly); EUR-only src/main/ TU, moot for build
 * safety per tools/configure.py's region-scoping rule.
 */

typedef struct {
    int pop_count;   /* +0x00 -- GX FIFO MTX_POP (opcode 0x12) arg */
    int mtx_mode;      /* +0x04 -- GX FIFO MTX_MODE (opcode 0x10) arg */
} GxMtxPopMode;

GxMtxPopMode data_02102254 = {
    1, 2,
};
