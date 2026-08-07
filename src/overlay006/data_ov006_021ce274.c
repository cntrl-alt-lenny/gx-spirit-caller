/* data_ov006_021ce274 (12 bytes, 4-aligned): kv_t[3], reuses the
 * already-shipped kv_t typedef (data_ov006_021ce29c.c) verbatim,
 * cm-restock-carve-1. Case sel=2 of the same table-of-tables twins as
 * data_ov006_021ce38a/_3ae/_3d6/_3fe (see data_ov006_021ce38a.c for the
 * full family writeup) -- _LIT1 in both func_ov006_021c7f5c.s and
 * func_ov006_021c8068.s, loop bound `mov ip,#0x3`. Ends with the same
 * {-1,0} sentinel already documented in 3 of the family's shipped
 * siblings. This is the 9th and final member of the family (case
 * selectors 1-9 all now shipped: _3fe, _274, _38a, _29c, _3d6, _56c,
 * _3ae, _5c4, _2ac). relocs.txt: 2 loads, zero embedded pointers. Kept
 * non-const, matching the symbol's own prior non-const declaration
 * (.data ground truth).
 */
typedef struct {
    short key;
    short val;
} kv_t;

kv_t data_ov006_021ce274[3] = {
    { 1, 1 },
    { 0, 2 },
    { -1, 0 },
};
