/* data_ov012_021cc07c (4 bytes, 4-aligned): NEW carve as part of
 * cm-data-inference-7, filling a previously-unclaimed delinks.txt gap
 * between sibling data_ov012_021cc078 and data_ov012_021cc080 -- part
 * of the same real 56-byte object, see data_ov012_021cc06c.c.
 *
 * STRONG, doubly proven: `relocs.txt` (`from:0x021cc07c kind:load
 * to:0x021caf80`) confirms this word is a genuine relocated pointer,
 * AND the raw bytes independently decode to the exact literal address
 * of func_ov012_021caf80. Sole consumer func_ov012_021ca964.s:278-280
 * (single live loop iteration, `cmp r8,#1`) passes it whole to
 * func_ov000_021ac530.c:7-9 (`*(int*)((char*)p+0x10)=v` -- stored as a
 * plain 32-bit value, not dereferenced).
 *
 * Raw address-literal cast, not `extern char X; &X` (this project's
 * usual not-yet-carved-target idiom, docs/research/cluster-d-recipe.md)
 * -- deliberately: an `&symbol` reference makes mwcc emit a real
 * relocation, which places the containing global in `.data` regardless
 * of its `const` qualifier (confirmed against this project's own D-1
 * worked example, src/main/data_0210210c.c, which is itself `.data` in
 * delinks.txt for exactly this reason -- and confirmed the hard way
 * this wave: an earlier `&func_ov012_021caf80` draft built with this
 * word silently missing from `.rodata`). This object's ground-truth
 * section is `.rodata` (sandwiched between .rodata siblings
 * data_ov012_021cc078/021cc080), so a real relocation would corrupt
 * the section -- a literal cast carries no relocation and compiles
 * cleanly into `.rodata`, matching the precedent already set by
 * data_ov012_021cc180 (cm-data-inference-6) for the same situation.
 */

void *const data_ov012_021cc07c = (void *)0x021caf80;
