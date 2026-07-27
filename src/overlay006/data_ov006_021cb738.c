/* data_ov006_021cb738 -- 16-entry RGB555 palette ramp (32 bytes),
 * black -> bright spike -> descending dark blue. Same
 * "load base, n=0x20, copy into palette RAM (0x05000400)" idiom as the
 * shipped sibling data_020b4728. Sole consumer func_ov006_021c48e0.s
 * (_LIT6), confirmed via
 * config/eur/arm9/overlays/ov006/relocs.txt. See
 * docs/queue/claude-scaffolder.md (cm-data-inference-5).
 */

const unsigned short data_ov006_021cb738[16] = {
    0x0000, 0x7f57, 0x7b15, 0x72d4, 0x6eb2, 0x6670, 0x622f, 0x59ed,
    0x55cc, 0x4d8a, 0x4948, 0x4107, 0x3cc5, 0x34a3, 0x3062, 0x2820,
};
