/* data_ov006_021cb718 -- 16-entry RGB555 palette ramp (32 bytes),
 * black -> near-white spike -> descending dark blue. Same
 * "load base, n=0x20, copy into palette RAM (0x05000400)" idiom as the
 * shipped sibling data_020b4728. Sole consumer func_ov006_021c48e0.s
 * (_LIT5), confirmed via
 * config/eur/arm9/overlays/ov006/relocs.txt. See
 * docs/queue/claude-scaffolder.md (cm-data-inference-5).
 */

const unsigned short data_ov006_021cb718[16] = {
    0x0000, 0x7ffe, 0x7fbc, 0x7b7a, 0x7b38, 0x76f5, 0x76b3, 0x7271,
    0x722f, 0x71ed, 0x6dab, 0x6d69, 0x6926, 0x68e4, 0x64a2, 0x6460,
};
