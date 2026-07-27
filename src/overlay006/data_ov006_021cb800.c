/* data_ov006_021cb800 -- 16-entry RGB555 palette ramp (32 bytes), the
 * same "load base, n=0x20, copy into palette RAM (0x05000400)" idiom as
 * shipped sibling data_ov006_021cb738. Sole consumer func_ov006_021c669c.c:23
 * -- `func_0208ff84(data_ov006_021cb800, 0xa0, 0x20)`. Byte-identical to
 * already-shipped data_ov006_021cb738 -- same ramp reused at a second
 * palette-RAM offset, not a duplicate investigation.
 */

const unsigned short data_ov006_021cb800[16] = {
    0x0000, 0x7f57, 0x7b15, 0x72d4, 0x6eb2, 0x6670, 0x622f, 0x59ed,
    0x55cc, 0x4d8a, 0x4948, 0x4107, 0x3cc5, 0x34a3, 0x3062, 0x2820,
};
