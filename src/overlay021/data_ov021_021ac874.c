/* data_ov021_021ac874 (44 bytes, 4-aligned): int[11] identity table
 * {0,1,...,10}. Sole consumer src/overlay021/func_ov021_021aab7c.s (a
 * permanently-.s "GLOBAL_ASM endgame" function, brief 302 -- matched, not
 * planned for a C port). The index into this table is explicitly
 * bounds-checked to exactly [0,10] immediately before the load (lines
 * 99-107: `bic r4,r4,#0x6; bmi .L_180` rejects negative, `cmp r6,#0xb;
 * bge .L_180` rejects >=11, THEN `ldr r1,_LIT4; ldr r1,[r1,r6,lsl#2]`) --
 * loop/branch-bound-proven to require exactly 11 entries, matching the
 * extracted 44 bytes exactly. Result is passed as func_02022234's 2nd
 * argument (r1, after `mov r0,#0x2`).
 * relocs.txt:116 `from:0x021aad50 kind:load to:0x021ac874 module:overlay(21)`
 * (table base, `_LIT4` at .s line 139); relocs.txt has no reloc for any
 * individual entry since all 11 words are plain non-pointer integers, not
 * addresses -- confirmed by the word breakdown (no value in the
 * 0x02xxxxxx range).
 * Immediately followed by the already-shipped data_ov021_021ac8a0.c
 * (.data 0x021ac8a0-...), confirming the end boundary exactly.
 * Section: .data (delinks.txt 0x021abea0-0x021ace80) -> NOT const, even
 * though the content is a fixed identity sequence: the ORIGINAL linker
 * placed it in .data, not .rodata, so `const` here would relocate it to
 * .rodata at link time and break byte-identity (data_021024a0.c documents
 * this exact same non-const-despite-looking-constant situation).
 */
int data_ov021_021ac874[11] = {
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
};
