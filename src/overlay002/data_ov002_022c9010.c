/* data_ov002_022c9010 (40 bytes, 4-aligned): retyped from opaque bytes to
 * a typed struct array as part of cm-data-inference-8. One of the same 8
 * near-identical "card-ID -> handler-pointer pair" tables documented in
 * data_ov002_022c9038.c (siblings: _022c86b8/_022c9250/_022c89a0/_022c8ff0/
 * _022c9508/_022c9ad0).
 *
 * The Ov002CardHandlerRecord type matches the one already shipped in
 * data_ov002_022c9038.c/_022c9ad0.c/_022c89a0.c verbatim -- one semantic
 * record shape, independently redeclared per TU per this codebase's
 * existing convention (no shared header). Pointer field emitted as a raw
 * (void *)0x... literal-address cast (same reasoning as every other table
 * in this family -- avoids the &symbol/.data placement bug). Byte content
 * is an exact reinterpretation of the same bytes previously shipped as
 * `const unsigned char data_ov002_022c9010[40]`, mechanically parsed out
 * of the previous literal, never hand-transcribed.
 */
typedef struct {
    unsigned int cardId;  /* offset 0x0 */
    void *handler;         /* offset 0x4 */
} Ov002CardHandlerRecord;

const Ov002CardHandlerRecord data_ov002_022c9010[5] = {
    { 0x15e4, (void *)0x0229110c },
    { 0x192f, (void *)0x0229110c },
    { 0x13fe, (void *)0x022919a8 },
    { 0x1889, (void *)0x0229183c },
    { 0x1927, (void *)0x02291900 },
};
