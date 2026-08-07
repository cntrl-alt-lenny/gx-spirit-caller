/* data_ov006_021cc034 (8 bytes, 4-aligned): {s16 x0,y0,x1,y1} rectangle
 * bounds struct, cm-restock-carve-1. Consumer func_ov006_021be948.s
 * (lines ~153-174): textbook `x0<=x<=x1 && y0<=y<=y1` fast-path bounds
 * check on the function's own (x,y) touch-point args, feeding an
 * `out->code = 4` result on a hit. Values (0,30,255,165) span nearly the
 * whole 256x192 DS screen width, y-banded 30-165 -- a plausible "main
 * playfield" catch-all, fired when nothing more specific matched.
 * relocs.txt: two separate pool-load relocations to the same symbol
 * (from the two `ldr r0/r1, .L_...` loads of this address), nothing
 * internal to the 8 bytes. Kept non-const, matching the symbol's own
 * prior non-const declaration (.data ground truth).
 */
typedef struct {
    short x0, y0, x1, y1;
} Ov006Rect021cc034;

Ov006Rect021cc034 data_ov006_021cc034 = { 0, 30, 255, 165 };
