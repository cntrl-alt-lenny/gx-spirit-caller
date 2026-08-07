/* data_ov006_021cde48 (96 bytes, 4-aligned): TouchBoxEntry[8], touch
 * hit-test companion to the icon-position table data_ov006_021cdf88,
 * cm-restock-carve-1. Same struct as data_ov006_021cddfc (see that file
 * for the field-provenance writeup). Decisive evidence: the (xMin,yMin)
 * pair of every one of the 8 records reproduces data_ov006_021cdf88[i]'s
 * own (x,y) field EXACTLY, in order, and id==i is the df88 record index
 * -- an exact coordinate match against an already-fully-resolved sibling
 * table. Box size is 24x24 for the off-grid icon (record 0) and 40x40 for
 * the 7 grid icons, matching typical DS icon sprite dimensions. Consumer
 * func_ov006_021c4348.s (same cascade idiom as data_ov006_021cddfc's
 * consumer, 8-record loop bound `cmp ip,#0x8`), called from
 * func_ov006_021c1d74.s right after the same func_02006110 touch-read
 * pattern -- func_ov006_021c1d74 is also the draw-side consumer of df88
 * (via func_ov006_021c32ac/func_ov006_021c3384), confirming this is
 * df88's dedicated touch companion. relocs.txt: single load reloc
 * matching the consumer's own literal pool (_LIT0). Kept non-const,
 * matching the symbol's own prior non-const declaration (.data ground
 * truth).
 */
typedef struct {
    short xMin, yMin, xMax, yMax;
    int   id;
} TouchBoxEntry;

TouchBoxEntry data_ov006_021cde48[8] = {
    { 231, 167, 254, 190, 0 },
    { 24,  47,  63,  86,  1 },
    { 80,  47,  119, 86,  2 },
    { 136, 47,  175, 86,  3 },
    { 192, 47,  231, 86,  4 },
    { 52,  103, 91,  142, 5 },
    { 108, 103, 147, 142, 6 },
    { 164, 103, 203, 142, 7 },
};
