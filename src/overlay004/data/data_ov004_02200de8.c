/* data_ov004_02200de8 (12 bytes, 4-aligned, .rodata): wave 14 struct
 * retype. Sole consumer func_ov004_021d3578.s loads this address and
 * `ldmia`s exactly 3 words onto the stack before calling
 * func_020822c8 -- an already-matched, byte-verified C function whose
 * own real parameter type is `const struct {unsigned int a,b,c;} *`
 * (see src/main/func_020822c8.c's triple_020822c8_t). Direct
 * consumer-type proof, not a guess. Ground truth section is .rodata
 * (delinks.txt), so const is kept, matching the pre-existing
 * declaration.
 */

typedef struct {
    unsigned int a, b, c;
} data_ov004_02200de8_t;

const data_ov004_02200de8_t data_ov004_02200de8 = {
    0x00080800, 0x00060000, 0x00000000,
};
