/* data_ov006_021cb5f4 (24 bytes, 4-aligned) -- opaque int-stride table,
 * gap-carved immediately after the already-shipped data_ov006_021cb518.
 *
 * Single consumer, func_ov006_021c148c.c (delinks.txt: complete, i.e.
 * already byte-matched): `extern int data_ov006_021cb5f4[];` indexed as
 * `data_ov006_021cb5f4[arg1]` inside `if (arg1 != 0)` -- entry 0 is
 * intentionally unreached. Because that TU is already proven
 * byte-identical, the compiled `lsl #2` int stride behind this
 * declaration is not a guess. `arg1` is sourced (func_ov006_021bf844.s,
 * both call sites) from `func_0202b8c0(id)`, which returns a 3-bit
 * `entry.w1` bitfield (src/main/func_0202b8c0.c) -- a hardware-enforced
 * [0,7] index.
 *
 * The next known symbol, data_ov006_021cb60c (still uncarved, evidenced
 * by its own consumer func_ov006_021c12fc.c), starts right after these
 * 24 bytes, so 6 elements is the full evidenced extent -- not the
 * bitfield's theoretical max. That undersized-vs-bitfield shape matches
 * the already-shipped sibling data_ov006_021cb680.c (88 bytes / 22
 * elements against a 5-bit [0,31] field for func_ov006_021c13c4), the
 * third member of this same "0201e5b8 command-record family" (n=3:
 * 021c12fc/021c13c4/021c148c). Ground-truth bytes decode as one
 * non-pointer word at index 0 (0x19101915, matching the unreached-entry
 * pattern) followed by five 0x021cbXXX/0x021cdXXX values -- valid
 * addresses back into this same overlay's rodata, the same shape as
 * data_ov006_021cb680's proven entries (cm-data-inference-6 confirmed
 * and retyped data_ov006_021cb680 as int[22] on this exact reading, at
 * its original address/size -- unchanged from when this comment was
 * written). Kept as an opaque byte blob (matching data_ov006_021cb518.c
 * convention) since only the stride is evidenced, not a decoded
 * per-entry meaning.
 */

const unsigned char data_ov006_021cb5f4[24] = {
    0x15, 0x19, 0x10, 0x19, 0x0c, 0xc0, 0x1c, 0x02, 0x84, 0xbf, 0x1c, 0x02,
    0x94, 0xbf, 0x1c, 0x02, 0x08, 0xdd, 0x1c, 0x02, 0xc4, 0xbf, 0x1c, 0x02,
};
