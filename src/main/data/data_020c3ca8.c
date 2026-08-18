/* data_020c3ca8 (8 bytes, 4-aligned): string constant "LC08" (likely a
 * font/point-size tag; not otherwise traced, out of this wave's scope).
 * "LC08" (4 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader: data_020b46e0.s (`.extern data_020c3ca8` / `.word
 * data_020c3ca8`, cluster-c-recipe.md Pattern 3 chunk generator
 * output, already shipped) -- an 18-entry consecutive char*-table;
 * this is entry 12 of 18. `data_worklist.py` reports 0 readers for
 * this symbol because its reader-count only follows relocations whose
 * SOURCE resolves to a known FUNCTION (analyze_symbols.
 * build_call_graph); a load sourced from another DATA symbol (this
 * table) is dropped into unresolved_loads and never counted -- the
 * symbol is not actually reader-less, the counting method has a
 * blind spot. See cm-restock-carve-9's Part 2 for the full finding
 * (this candidate's first attempt tried absorbing all 4 sibling
 * strings into one un-named blob on the theory that nothing
 * referenced them individually; `data_020b46e0.s`'s explicit
 * `.extern` list disproved that -- it names all four, so each keeps
 * its own top-level declaration here instead).
 * No outgoing relocs in this span (plain text, not pointers) --
 * relocs.txt cross-checked over 0x020c3ca8-0x020c3cb0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c3ca8[8] = "LC08";
