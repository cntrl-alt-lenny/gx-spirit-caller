/* data_ov014_021b4bf8 (16 bytes, 4-aligned): retyped from opaque bytes to
 * a dual-purpose struct as part of cm-data-inference-9 (ov014's first
 * touch this campaign). Two independent, non-overlapping consumers:
 * func_ov014_021b3938.s copies bytes 0x0-0x7 as an 8-byte sprintf format
 * string ("No.%02d") passed to OS_SPrintf; func_ov014_021b2908.s reads
 * bytes 0x8-0xf as 4 halfwords fed with count=4 into
 * func_ov014_021b3a84.s, which walks them with a genuine loop counter at
 * 2-byte stride, RGB555-unpacking and blending each -- a blue->cyan fade
 * ramp (R=0 const, B saturated, G rising 4->18->25->27). USA/JPN's
 * byte-identical consumer logic (func_ov014_021b3838.s/_021b2808.s/
 * _021b3984.s in both regions) confirms no cross-region divergence.
 */

typedef struct {
    char fmt[8];
    unsigned short colors[4];
} Ov014Blob021b4bf8;

const Ov014Blob021b4bf8 data_ov014_021b4bf8 = {
    "No.%02d",
    { 0x4080, 0x7e40, 0x7f20, 0x7f60 },
};
