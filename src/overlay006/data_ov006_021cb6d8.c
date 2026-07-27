/* data_ov006_021cb6d8 -- 16-entry RGB555 palette ramp (32 bytes),
 * black -> ascending cyan-white. Same "load base, n=0x20, copy into
 * palette RAM (0x05000400)" idiom as the shipped sibling data_020b4728.
 * Sole consumer func_ov006_021c48e0.s (_LIT8), confirmed via
 * config/eur/arm9/overlays/ov006/relocs.txt. See
 * docs/queue/claude-scaffolder.md (cm-data-inference-5).
 */

const unsigned short data_ov006_021cb6d8[16] = {
    0x0000, 0x5123, 0x5564, 0x5985, 0x59c6, 0x5de7, 0x6228, 0x6649,
    0x6a8b, 0x6aac, 0x6eed, 0x730e, 0x774f, 0x7770, 0x7bb1, 0x7fd2,
};
