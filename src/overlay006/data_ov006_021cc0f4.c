/* Cluster D-2 — data_ov006_021cc0f4 (36 bytes).
 *
 * cm-data-inference-3: sibling of data_ov006_021cc588 (12-byte-record
 * {short,short,int,int} shape) -- same consumer code selects between
 * this table and its siblings by a runtime mode field; this table's own
 * record count (3 = 36/12) matches the shared consumers' hard-coded
 * loop-bound literal exactly, independently corroborating the stride
 * found via data_ov006_021cc588. See that file for the full evidence
 * writeup.
 *
 * Byte content is an exact reinterpretation of the same bytes previously
 * shipped as `unsigned char data_ov006_021cc0f4[36]` -- mechanically
 * parsed out of the previous literal and round-trip-verified, never
 * hand-transcribed.
 */
typedef struct {
    short field0;   /* offset 0x0 */
    short field1;    /* offset 0x2 */
    int field2;        /* offset 0x4 */
    int field3;          /* offset 0x8 */
} RecordOv006_021cc588;

RecordOv006_021cc588 data_ov006_021cc0f4[3] = {
    { 15, 15, 0, 2 },
    { 41, 15, 2, 3 },
    { 62, 15, 3, 4 },
};
