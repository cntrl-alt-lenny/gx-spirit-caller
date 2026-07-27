/* data_ov006_021cb778 -- 16-entry RGB555 palette ramp (32 bytes),
 * black -> bright spike -> descending dark blue. Same "load base,
 * n=0x20, copy into palette RAM (0x05000400)" idiom as the shipped
 * sibling data_020b4728. Sole consumer func_ov006_021c4574.c,
 * confirmed via config/eur/arm9/overlays/ov006/relocs.txt. See
 * docs/queue/claude-scaffolder.md (cm-data-inference-5).
 */

const unsigned short data_ov006_021cb778[16] = {
    0x0000, 0x7b94, 0x7353, 0x6f11, 0x66d0, 0x5e8e, 0x5a4d, 0x520b,
    0x4dca, 0x4589, 0x3d47, 0x3906, 0x30c4, 0x2883, 0x2441, 0x1c00,
};
