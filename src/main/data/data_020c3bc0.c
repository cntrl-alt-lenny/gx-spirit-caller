/* data_020c3bc0 (232 bytes, 4-aligned): StateMain handler-index table.
 * Sole reader: src/main/func_02000c4c.c:14,27,31,40 ("StateMain_GetHandler
 * ByIndex" per docs/research/naming-plan/main-naming.md:17; see also
 * docs/research/dossiers/02000c4c.md and docs/research/xref/DataToFunction.md
 * :149). Flat int[58]:
 *   v = data_020c3bc0[idx];
 *   v == -1        -> sentinel, no handler
 *   v & 0xff000000 -> v is itself a raw code/data address; return as-is
 *   else           -> v indexes data_020c4204[] (16B structs, 44 entries,
 *                      already carved, delinks.txt:20334-20336)
 * Element [0] is a genuine relocation (relocs.txt:19348 from:0x020c3bc0
 * kind:load to:0x02000c44) to the already-matched func_02000c44
 * (`return 1;`) -- confirms the tagged-union reading above.
 * Callers: src/main/func_02000ef8.s:40, func_02000f84.s:16,
 * func_02001540.s:274 (bl func_02000c4c).
 * Not const: original section is .data (delinks.txt line 4), not .rodata.
 */
extern int func_02000c44(void);

int data_020c3bc0[58] = {
    (int)func_02000c44, 12, 24, -1, 14, -1, 15, -1, 16, -1,
    5, -1, 8, -1, 7, -1, 9, -1, 10, -1,
    11, -1, 2, -1, 18, -1, 19, -1, 20, -1,
    21, -1, 23, -1, 25, -1, 26, -1, 37, -1,
    33, -1, 28, -1, 29, -1, 31, -1, 32, -1,
    27, -1, 4, -1, 34, -1, 35, -1,
};
