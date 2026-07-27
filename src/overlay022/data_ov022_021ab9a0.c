/* data_ov022_021ab9a0 (28 bytes, 4-aligned): retyped from opaque bytes to
 * a void* pointer table as part of cm-data-inference-10. relocs.txt
 * proves 6 of 7 word slots are real linker relocations (offset 0x08 is
 * a plain NULL, no relocation needed) -- 6+1=7 elements, filling the
 * declared 28 bytes exactly. All 6 non-null targets resolve to the
 * start of sibling data_ov022_0... symbols, never mid-symbol. Sole C
 * consumer func_ov022_021aa540.c indexes it by a genuine runtime
 * parameter (`data_ov022_021ab9a0[index]`) and passes the result to
 * func_02006c0c(void *table, int, int) (per the canonical signature
 * already documented in src/jpn/overlay006/ov006_core.h) -- confirming
 * pointer semantics, not plain int. Kept non-const, matching the
 * symbol's own prior non-const declaration (.data ground truth).
 * USA/JPN independently confirm the identical 7-slot/1-null shape at
 * their own region-shifted addresses (own relocs.txt, same pattern),
 * though neither has carved this symbol into its own source file yet.
 */

void *data_ov022_021ab9a0[7] = {
    (void *)0x021aba58,
    (void *)0x021aba78,
    0,
    (void *)0x021aba38,
    (void *)0x021ab9d8,
    (void *)0x021ab9f8,
    (void *)0x021aba18,
};
