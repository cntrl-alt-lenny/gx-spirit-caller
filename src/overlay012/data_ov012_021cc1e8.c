/* Cluster C Pattern 1 — data_ov012_021cc1e8 (160 bytes, 4-aligned).
 *
 * cm-data-inference-3: sole consumer func_ov012_021ca450.s copies all
 * 160 bytes to a stack temp, then computes a genuinely 2D address
 * (`sp + nibble*0x20 + (col-1)*4`, nibble a runtime context field) --
 * row stride 32 (0x20) and column stride 4 both match this table's own
 * layout exactly. Content is 5 byte-identical 32-byte rows (7 pointers
 * + a trailing NULL), independently confirmed by relocs.txt: 35 real
 * kind:load relocations, one at every non-zero word, all resolving to
 * 7 real target addresses in round-robin order.
 *
 * The 7 pointer targets (data_ov012_021cc2cc etc.) have no dedicated
 * source file yet -- they sit in an unclaimed .data gap. Emitted as raw
 * (void *)0x... literal-address casts rather than symbol references:
 * this needs no extern declaration for the uncarved targets, and
 * produces the identical final linked bytes either way (the numeric
 * address is already the correct, stable resolved value; a relocation
 * and a raw literal both bottom out at the same 4 bytes once linked).
 * Confirmed empirically for this file (see cm-data-inference-3 writeup).
 *
 * Byte content is an exact reinterpretation of the same bytes previously
 * shipped as `const unsigned char data_ov012_021cc1e8[160]` --
 * mechanically parsed out of the previous literal and round-trip-
 * verified, never hand-transcribed.
 */
void *const data_ov012_021cc1e8[5][8] = {
    { (void *)0x021cc2cc, (void *)0x021cc2b8, (void *)0x021cc3a8, (void *)0x021cc3bc,
      (void *)0x021cc2e0, (void *)0x021cc330, (void *)0x021cc2a4, 0 },
    { (void *)0x021cc2cc, (void *)0x021cc2b8, (void *)0x021cc3a8, (void *)0x021cc3bc,
      (void *)0x021cc2e0, (void *)0x021cc330, (void *)0x021cc2a4, 0 },
    { (void *)0x021cc2cc, (void *)0x021cc2b8, (void *)0x021cc3a8, (void *)0x021cc3bc,
      (void *)0x021cc2e0, (void *)0x021cc330, (void *)0x021cc2a4, 0 },
    { (void *)0x021cc2cc, (void *)0x021cc2b8, (void *)0x021cc3a8, (void *)0x021cc3bc,
      (void *)0x021cc2e0, (void *)0x021cc330, (void *)0x021cc2a4, 0 },
    { (void *)0x021cc2cc, (void *)0x021cc2b8, (void *)0x021cc3a8, (void *)0x021cc3bc,
      (void *)0x021cc2e0, (void *)0x021cc330, (void *)0x021cc2a4, 0 },
};
