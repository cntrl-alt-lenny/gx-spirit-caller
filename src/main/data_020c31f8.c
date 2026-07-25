/* Cluster C Pattern 1 — data_020c31f8 (256 bytes, 4-aligned).
 *
 * Retyped from opaque `const unsigned char[256]` to
 * `const short data_020c31f8[128]` (cm-data-inference-2 batch 2):
 * stride 2, 128 records, single SIGNED 16-bit field. Evidence: the
 * matched consumer src/main/func_02087df4.legacy_sp3.c already
 * declares `extern short data_020c31f8[];` and indexes it as
 * `data_020c31f8[a2]` with a2 a real runtime parameter — this retype
 * makes that existing extern correctly typed against the real
 * definition instead of merely link-compatible across TUs. Three
 * other consumers (func_0208a8f8.s, func_02087ab4.s, func_0203ad44.s)
 * only take the array's address (raw `.word data_020c31f8` literal
 * pool entries), so they need no change. Byte content is an exact
 * reinterpretation of the same bytes previously shipped as
 * `const unsigned char data_020c31f8[256]` — this retype changes
 * only the C-level type, not any byte value.
 */

const short data_020c31f8[128] = {
    -32768, -421, -361, -325, -300, -281, -265, -252,
    -240, -230, -221, -212, -205, -198, -192, -186,
    -180, -175, -170, -165, -161, -156, -152, -148,
    -145, -141, -138, -134, -131, -128, -125, -122,
    -120, -117, -114, -112, -110, -107, -105, -103,
    -100, -98, -96, -94, -92, -90, -88, -86,
    -85, -83, -81, -79, -78, -76, -74, -73,
    -71, -70, -68, -67, -65, -64, -62, -61,
    -60, -58, -57, -56, -54, -53, -52, -51,
    -49, -48, -47, -46, -45, -43, -42, -41,
    -40, -39, -38, -37, -36, -35, -34, -33,
    -32, -31, -30, -29, -28, -27, -26, -25,
    -24, -23, -23, -22, -21, -20, -19, -18,
    -17, -17, -16, -15, -14, -13, -12, -12,
    -11, -10, -9, -9, -8, -7, -6, -6,
    -5, -4, -3, -3, -2, -1, -1, 0,
};
