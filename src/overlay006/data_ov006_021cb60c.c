/* data_ov006_021cb60c (40 bytes, 4-aligned): table of 10 DATA pointers
 * into ov006's own uncarved .rodata (0x021cbf24 region) -- NOT a plain
 * `int[]` despite the already-shipped consumer's own `extern int
 * data_ov006_021cb60c[];` forward declaration (func_ov006_021c12fc.c,
 * cm-restock-carve-8's required cross-check caught the mismatch: every
 * one of the 10 words resolves to a real ARM9 address, confirmed via
 * relocs.txt's own outgoing relocations sourced from inside this
 * symbol's span, not by trusting the older extern's type). Consumer:
 * `OS_SPrintf(buf, data_ov006_021cdd78, data_ov006_021cb60c[arg1])` --
 * the format string almost certainly uses `%s`, matching a pointer
 * argument passed through the same 4-byte slot an `int` would occupy
 * (same calling-convention width, so the existing extern's `int`
 * annotation still links and behaves identically; not touched here,
 * out of this wave's scope). relocs.txt: 10 outgoing `kind:load`
 * relocations, one per word, all `module:overlay(6)`, all landing on
 * still-uncarved `data_ov006_021cbf*` placeholders (symbols.txt
 * confirms each target already has its own `data_` entry). Raw
 * address-literal casts, not `extern char X; &X` -- an `&symbol`
 * reference would force this `const` global into `.data`; ground truth
 * is `.rodata` (delinks.txt section header). Precedent:
 * data_ov011_021d2fd4.c / data_ov000_021b569c.c family.
 */
void *const data_ov006_021cb60c[10] = {
    (void *)0x021cbffc,  /* -> data_ov006_021cbffc (uncarved) */
    (void *)0x021cbf8c,  /* -> data_ov006_021cbf8c (uncarved) */
    (void *)0x021cbf64,  /* -> data_ov006_021cbf64 (uncarved) */
    (void *)0x021cbfb4,  /* -> data_ov006_021cbfb4 (uncarved) */
    (void *)0x021cbf34,  /* -> data_ov006_021cbf34 (uncarved) */
    (void *)0x021cbf9c,  /* -> data_ov006_021cbf9c (uncarved) */
    (void *)0x021cbf5c,  /* -> data_ov006_021cbf5c (uncarved) */
    (void *)0x021cbf28,  /* -> data_ov006_021cbf28 (uncarved) */
    (void *)0x021cbfcc,  /* -> data_ov006_021cbfcc (uncarved) */
    (void *)0x021cbf4c,  /* -> data_ov006_021cbf4c (uncarved) */
};
