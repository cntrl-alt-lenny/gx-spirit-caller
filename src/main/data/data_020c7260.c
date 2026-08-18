/* cm-restock-carve-9 Part 2 PoC (retest — see data_020c3ca8.c's
 * history in git log / the research doc for the first attempt, which
 * hit an already-shipped `.extern` consumer and was reverted to four
 * individual files instead of answering the question). This ONE
 * declaration absorbs FOUR placeholder addresses at once --
 * data_020c7260/_020c7277/_020c728e/_020c72a5 -- each an independent
 * data_worklist.py "shape=string, 0 readers" candidate.
 *
 * Verified clean of the failure mode that killed the first attempt,
 * BEFORE drafting, not after:
 *   - `grep -rn` for all four names across the ENTIRE `src/` tree and
 *     `config/eur/`: zero hits outside `symbols.txt`'s own placeholder
 *     listing. No already-shipped `.c`/`.s` file references any of
 *     them by name (unlike data_020c3ca8's first attempt, which broke
 *     on exactly this -- an old Pattern-3-generated `.s` chunk file
 *     `.extern`'d three of the four absorbed names).
 *   - The one real consumer (relocs.txt-proven, see below) is itself
 *     STILL UNCARVED: `data_020c72c0` has a `symbols.txt` placeholder
 *     entry but no `delinks.txt` TU at all -- confirmed raw gap bytes,
 *     copied verbatim from the original ROM at build time, not
 *     compiled source with a link-time name dependency.
 *   - Zero outgoing relocations from inside this span (plain text,
 *     not pointers) -- relocs.txt cross-checked over
 *     0x020c7260-0x020c72c0.
 *
 * Reader (all four, relocs.txt-proven): a 4-entry consecutive
 * char*-table at 0x020c72c0-0x020c72d0 (stride 4, immediately
 * adjacent, itself unmatched/uncarved):
 *   from:0x020c72c0 kind:load to:0x020c728e  (data_020c728e)
 *   from:0x020c72c4 kind:load to:0x020c72a5  (data_020c72a5)
 *   from:0x020c72c8 kind:load to:0x020c7260  (data_020c7260)
 *   from:0x020c72cc kind:load to:0x020c7277  (data_020c7277)
 * `data_worklist.py` reports 0 readers for all four because its
 * reader-count only follows relocations whose SOURCE resolves to a
 * known FUNCTION (analyze_symbols.build_call_graph); a load sourced
 * from another DATA symbol (this table) is dropped into
 * unresolved_loads and never counted.
 *
 * Single top-level declaration (n=1) by design: P-50 (codegen-walls.md)
 * proves composed multi-*global* TUs reorder by size for n=2 differing
 * sizes and unconditionally for n>2. Emitting one array that happens
 * to CONTAIN four logical strings sidesteps that wall entirely --
 * there is nothing for mwcc to reorder. The three absorbed addresses
 * keep their unchanged `symbols.txt` entries but get no separate C
 * declaration.
 *
 * 96 bytes, 4-aligned both ends (delinks.txt gap 0x020c7260-0x020c72c0
 * was fully open -- no prior TU). Not const: ground truth section is
 * .data (delinks.txt). Content verified byte-for-byte against
 * build/eur/build/arm9.bin (four `/credit/the_end.LZ*` archive-member
 * paths -- credits-sequence background layers, by extension).
 */
char data_020c7260[96] =
    "/credit/the_end.LZncer\0"
    "/credit/the_end.LZnanr\0"
    "/credit/the_end.LZncgr\0"
    "/credit/the_end.LZnclr";
