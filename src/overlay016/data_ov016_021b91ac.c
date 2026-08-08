/* data_ov016_021b91ac (112 bytes, 4-aligned): 11-entry touch-cell table --
 * Ov016TouchCellSm{x,y,w,h,cellW,cellH} (10 bytes, no trailing attr; matches
 * ov016_core.h's documented "021b9184 record array, stride 10" family) +
 * 2-byte 4-alignment tail.
 *
 * This is algebraically arr[4..14] of the SAME logical record array based at
 * data_ov016_021b9184 (021b9184 + 4*10 == 021b91ac exactly -- confirmed via
 * the neighboring already-carved 10-byte siblings data_ov016_021b9184/918e/
 * 9198/91a2, each exactly +10 apart, in config/eur/arm9/overlays/ov016/
 * symbols.txt). It was split into its own symbol because entry [4] is
 * addressed by a constant-folded literal while entries [5..14] are addressed
 * by a runtime loop:
 * Consumer: src/overlay016/func_ov016_021b423c.s (still un-matched, whole-
 * function .s):
 *  - line 196 `ldr r4, _LIT10` (_LIT10 = data_ov016_021b91ac, line 390) ->
 *    `mov r0,r4; bl func_ov016_021b287c` (hit-test) -> `mov r3,r4;
 *    bl func_ov016_021b3498` (draw) -- entry [4] alone.
 *  - lines 215-238 (`.L_2dc` loop): `ldr r5,_LIT4[=data_ov016_021b9184];
 *    mov fp,#0xa[=10]; add r0,r6,#5; mul r4,r0,fp; add r0,r5,r4` (10
 *    iterations, r6=0..9) -> same hit-test/draw pair per entry -- entries
 *    [5..14].
 * (config/eur/arm9/overlays/ov016/relocs.txt:356,
 *   from:0x021b47ac kind:load to:0x021b91ac module:overlay(16)).
 * Entry [4] (the constant-addressed one, first row below) uniquely has
 * w=49 vs w=39 for all 10 loop entries; h=28, cellW=2, cellH=0 are constant
 * across all 11 (cellH=0 is the value actually stored; semantic meaning of
 * "0" for this particular field is not otherwise verified).
 * Section: .data start:0x021b8f80 end:0x021b9740 -- inside, so NOT const.
 */
typedef struct {
    unsigned short x;
    unsigned short y;
    unsigned char  w;
    unsigned char  h;
    unsigned short cellW;
    unsigned short cellH;
} Ov016TouchCellSm;  /* 10 bytes */

typedef struct {
    Ov016TouchCellSm cell[11];
    unsigned short   _pad;  /* 4-byte-alignment tail; unread by the consumer */
} Ov016TouchCellSmTable;    /* 112 bytes */

Ov016TouchCellSmTable data_ov016_021b91ac = {
    {
        { 172,  55, 49, 28, 2, 0 },  /* entry [4] -- constant-addressed */
        {  37, 123, 39, 28, 2, 0 },  /* entry [5] */
        {  37,  21, 39, 28, 2, 0 },  /* entry [6] */
        {  82,  21, 39, 28, 2, 0 },  /* entry [7] */
        { 127,  21, 39, 28, 2, 0 },  /* entry [8] */
        {  37,  55, 39, 28, 2, 0 },  /* entry [9] */
        {  82,  55, 39, 28, 2, 0 },  /* entry [10] */
        { 127,  55, 39, 28, 2, 0 },  /* entry [11] */
        {  37,  89, 39, 28, 2, 0 },  /* entry [12] */
        {  82,  89, 39, 28, 2, 0 },  /* entry [13] */
        { 127,  89, 39, 28, 2, 0 },  /* entry [14] */
    },
    0,
};
