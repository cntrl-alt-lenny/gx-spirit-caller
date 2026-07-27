/* D-2 wave 2: scalar array (0x84 bytes)
 *
 * cm-data-inference-3: sibling of data_ov006_021cc588 (12-byte-record
 * {short,short,int,int} shape) -- same consumer code
 * (func_ov006_021ba364.s / func_ov006_021bbe7c.s / func_ov006_021bd8ac.s)
 * selects between this table and its siblings by a runtime mode field;
 * this table's own record count (11 = 132/12) matches the shared
 * consumers' hard-coded loop-bound literal exactly, independently
 * corroborating the stride found via data_ov006_021cc588. See that file
 * for the full evidence writeup.
 *
 * Byte content is an exact reinterpretation of the same bytes previously
 * shipped as `unsigned char data_ov006_021cc478[132]` -- mechanically
 * parsed out of the previous literal and round-trip-verified, never
 * hand-transcribed.
 */
typedef struct {
    short field0;   /* offset 0x0 */
    short field1;    /* offset 0x2 */
    int field2;        /* offset 0x4 */
    int field3;          /* offset 0x8 */
} RecordOv006_021cc588;

RecordOv006_021cc588 data_ov006_021cc478[11] = {
    { 15, 15, 0, 2 },
    { 41, 15, 2, 3 },
    { 62, 15, 3, 4 },
    { 84, 20, 4, 6 },
    { 103, 20, 5, 7 },
    { 121, 20, 5, 8 },
    { 140, 20, 6, 9 },
    { 159, 20, 6, 10 },
    { 178, 20, 6, 11 },
    { 197, 20, 6, 12 },
    { 215, 20, 7, 13 },
};
