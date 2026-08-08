/* data_020c3f4c (8 bytes, 4-aligned): debug file reference. Consumer:
 * func_ov010_021b72c0 (Ov010_InitMode2Display, src/overlay010/
 * func_ov010_021b72c0.s:168-172) dereferences field 0 directly
 * (`ldr r1,[r1]`) and passes it to func_ov005_021aaf6c (ov005
 * file/archive-handle primitive). relocs.txt: 19367 from:0x020c3f4c
 * kind:load to:0x020c3f70 (internal, field 0); cross-module
 * config/eur/arm9/overlays/ov010/relocs.txt:747 from:0x021b7980
 * kind:load to:0x020c3f4c confirms the consumer's literal-pool slot.
 * Field 0 points at data_020c3f70, a plain ASCII path string
 * "/DataRoom/puzzletree" (verified, not carved here -- separate symbol).
 * Field 1 (0x3b9aca00 = 1,000,000,000) is not dereferenced by the one
 * traced reader; likely a generous/unbounded size cap passed to a
 * generic loader -- inferred from the round value, not directly witnessed
 * by any known consumer.
 * Not const: original section is .data (delinks.txt line 4), not .rodata.
 */
typedef struct {
    const char *path;
    unsigned int size_cap;   /* role inferred, not directly read by any traced consumer */
} DebugFileRef;

extern const char data_020c3f70[];   /* "/DataRoom/puzzletree" -- separate, uncarved symbol */

DebugFileRef data_020c3f4c = { data_020c3f70, 1000000000u };
