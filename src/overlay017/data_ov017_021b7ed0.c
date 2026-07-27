/* data_ov017_021b7ed0 (40 bytes, 4-aligned): retyped from opaque bytes to
 * a struct{short f0,f1}[10] record table as part of cm-data-inference-8.
 * Sits exactly between the wave-7-shipped siblings data_ov017_021b7e8c and
 * data_ov017_021b7ef8 (unsigned int[17] each) with zero gap on either side.
 * Sole consumer func_ov017_021b66a8.s walks all 10 records with an explicit
 * `mov r2,#0xa`-bounded loop (element count proven by immediate, not size
 * inference), stride 4 bytes/record.
 */

typedef struct {
    short f0;
    short f1;
} Row021b7ed0;

const Row021b7ed0 data_ov017_021b7ed0[10] = {
    { 232, 35 },
    { 256, 128 },
    { 232, 15 },
    { 256, 35 },
    { 232, 108 },
    { 256, 128 },
    { 232, 36 },
    { 256, 55 },
    { 232, 88 },
    { 256, 108 },
};
