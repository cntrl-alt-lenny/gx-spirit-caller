/* data_ov006_021cb680 (88 bytes, 4-aligned): retyped from opaque bytes
 * to a signed int[22] array as part of cm-data-inference-6. Address and
 * size are UNCHANGED from the original -- func_ov006_021c13c4.c's
 * already-matched relocation to this exact base (relocs.txt:
 * `from:0x021c1484 kind:load to:0x021cb680`) is ground truth and must
 * not shift.
 *
 * Already-matched sole consumer func_ov006_021c13c4.c:11,18 -- `extern
 * int data_ov006_021cb680[]; ... data_ov006_021cb680[arg1]` (computed-
 * stride, runtime-variable arg1) -- declares the element type `int`,
 * not a pointer type, and passes the raw value to OS_SPrintf() as a
 * formatted number rather than dereferencing it, so `int` (holding
 * each value as a plain 32-bit number) matches the existing match
 * exactly. Element 0 (0x9200fc) is a non-pointer/unreached-entry value
 * (also independently corroborated by already-shipped sibling
 * data_ov006_021cb5f4.c's header comment, describing the identical
 * "one non-pointer word at index 0" shape for a sibling of the same
 * "0201e5b8 command-record family"); elements 1-21 are valid
 * 0x021cbXXX/0x021ccXXX addresses back into this overlay's own rodata.
 *
 * NOTE: sibling data_ov006_021cb65c's consumer func_ov006_021be6f4.s
 * does a raw 40-byte pointer-arithmetic copy starting at 021cb65c's own
 * base, which reads 4 bytes past 021cb65c's 36-byte end directly into
 * this array's own element 0 -- pure address-range overlap in a walled
 * .s file, unrelated to and unaffected by either symbol's C-level type
 * or declared size. No boundary change is needed (or safe) here.
 */

const int data_ov006_021cb680[22] = {
    0x9200fc,
    0x21cbfd4, 0x21cbfdc, 0x21cbf7c, 0x21cbfac, 0x21cbfe4, 0x21cbf3c,
    0x21cc01c, 0x21cbf44, 0x21cbf2c, 0x21cbff4, 0x21cbfbc, 0x21cc004,
    0x21cbfa4, 0x21cbf6c, 0x21cc014, 0x21cbf54, 0x21cbf74, 0x21cbfec,
    0x21cc024, 0x21cc02c, 0x21cbf28,
};
