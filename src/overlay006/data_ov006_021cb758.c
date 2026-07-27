/* data_ov006_021cb758 -- 16-entry RGB555 palette ramp (32 bytes),
 * black -> ascending gold/yellow. Same "load base, n=0x20, copy into
 * palette RAM (0x05000400)" idiom as the shipped sibling
 * data_020b4728. Sole consumer func_ov006_021c48e0.s (_LIT9),
 * confirmed via config/eur/arm9/overlays/ov006/relocs.txt. See
 * docs/queue/claude-scaffolder.md (cm-data-inference-5).
 */

const unsigned short data_ov006_021cb758[16] = {
    0x0000, 0x1a24, 0x1e46, 0x2668, 0x2a8a, 0x2eac, 0x32ce, 0x3af0,
    0x3f12, 0x4333, 0x4b55, 0x4f77, 0x5399, 0x57bb, 0x5fdd, 0x63ff,
};
