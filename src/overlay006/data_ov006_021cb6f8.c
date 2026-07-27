/* data_ov006_021cb6f8 -- first 4 entries of a 16-entry RGB555 palette
 * ramp (8 bytes); the remaining 12 entries are data_ov006_021cb700,
 * carved as a separate symbol below.
 *
 * Both together form the same "load base, n=0x20, copy into palette
 * RAM (0x05000400)" idiom as the shipped sibling data_020b4728, black
 * -> white spike -> descending monotonic ramp. Sole consumer
 * func_ov006_021c4574.c, confirmed via
 * config/eur/arm9/overlays/ov006/relocs.txt.
 *
 * Split at this exact boundary (not left as one 16-entry array)
 * because config/eur/arm9/overlays/ov006/symbols.txt separately tags
 * `data_ov006_021cb700 ... ambiguous` here: dsd's own generated chunk
 * src/main/data/data_020c4204.s carries a real `.word
 * data_ov006_021cb700` linker reference to this exact address (an
 * internal cross-reference from an unrelated mechanically-generated
 * "Cluster C Pattern 3" chunk, not a semantic consumer of this data),
 * which the dsd gap-filler used to satisfy while this range was an
 * unclaimed gap. Carving the whole 32 bytes as one symbol left that
 * reference undefined at link time (confirmed via a real mwldarm
 * "Undefined: data_ov006_021cb700" error) -- splitting here keeps
 * both symbols real and linker-visible, matching the established
 * "never delete a dsd-generated marker" precedent. Bytes independently
 * extracted from extract/eur/arm9_overlays/ov006.bin and cross-checked
 * against the neighboring already-shipped data_ov006_021cb718. See
 * docs/queue/claude-scaffolder.md (cm-data-inference-5).
 */

const unsigned short data_ov006_021cb6f8[4] = {
    0x0000, 0x7fff, 0x77bf, 0x6f9e,
};

const unsigned short data_ov006_021cb700[12] = {
    0x635e, 0x5b3d, 0x52fd, 0x4adc, 0x429c, 0x365c,
    0x2e3b, 0x25fb, 0x1dda, 0x119a, 0x0979, 0x0139,
};
