/* data_ov006_021cb798 -- 16-entry RGB555 palette ramp (32 bytes),
 * black -> ascending warm-red -> pure white. Same "load base, n=0x20,
 * copy into palette RAM (0x05000400)" idiom as the shipped sibling
 * data_020b4728. Two consumers: func_ov006_021c48e0.s (_LIT7) and
 * func_ov006_021c4574.c, both confirmed via
 * config/eur/arm9/overlays/ov006/relocs.txt. See
 * docs/queue/claude-scaffolder.md (cm-data-inference-5).
 */

const unsigned short data_ov006_021cb798[16] = {
    0x0000, 0x24af, 0x2cf0, 0x3131, 0x3972, 0x3d94, 0x45d5, 0x4a16,
    0x5257, 0x5a98, 0x5ed9, 0x671a, 0x6b3c, 0x737d, 0x77be, 0x7fff,
};
