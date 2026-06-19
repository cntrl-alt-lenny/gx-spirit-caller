/* func_ov000_021af4d4: byte-low-zero check on a struct field at
 * offset 0x34. Same Shape B recipe as `func_ov000_021ab5ec`,
 * different struct + offset. See that file's header comment +
 * `docs/research/bit-test-0-or-1-idiom.md` § Shape B for the
 * bitfield-extract recipe rationale.
 */

struct LowByteStruct {
    unsigned int low8 : 8;
    unsigned int upper : 24;
};

extern struct LowByteStruct data_ov000_021c74ac[];

int func_ov000_021af4d4(void) {
    return data_ov000_021c74ac[0x34 / 4].low8 == 0;
}
