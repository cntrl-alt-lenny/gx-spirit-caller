/* data_ov006_021cddfc (24 bytes, 4-aligned): TouchBoxEntry[2] touch
 * hit-test table, cm-restock-carve-1. Consumer func_ov006_021c43bc.s
 * (ship-as-.s): stride-0xc loop over 2 records (`cmp r4,#0x2`), reads
 * [+0]/[+2]/[+4]/[+6] as ldrsh box bounds and [+8] as ldr id; the compare
 * chain is a closed-box test `xMin<=x<=xMax && yMin<=y<=yMax`, returning
 * the +8 id on a hit. Caller func_ov006_021c2510.s reads the touch point
 * via func_02006110 (documented project-wide as the touch/cursor reader,
 * e.g. src/overlay020/ov020_core.h:39) immediately before calling this
 * function, confirming x/y semantics; box maxima (254,190) sit just under
 * the DS touch screen's 256x192 bounds. relocs.txt: single load reloc
 * matching the consumer's own literal pool (_LIT0). Kept non-const,
 * matching the symbol's own prior non-const declaration (.data ground
 * truth).
 */
typedef struct {
    short xMin, yMin, xMax, yMax;
    int   id;
} TouchBoxEntry;

TouchBoxEntry data_ov006_021cddfc[2] = {
    { 231, 167, 254, 190, 0 },
    { 174, 167, 227, 190, 1 },
};
