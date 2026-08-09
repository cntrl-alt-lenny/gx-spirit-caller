/* data_ov011_021d3020 (20 bytes, 4-aligned): 10-entry, 2-byte-stride
 * unsigned byte-pair LUT. Previously flagged but undocumented --
 * docs/research/retriage/Ov011Deep.md:658/898 already surfaced the
 * access pattern ("accessed in `021ce50c` as a 10-entry, 2-byte-stride
 * LUT copied to `sp+0` via an unrolled 10-iteration byte-pair copy
 * loop... likely a small lookup table parallel to the already-
 * documented data_ov011_021d2fc8/021d2fc9 scroll-target bytes, but with
 * a different size/stride. Not previously cataloged anywhere in
 * docs/research/") without shipping it; this carve confirms and ships
 * it.
 *
 * Consumer: src/overlay011/func_ov011_021ce50c.s (GLOBAL_ASM whole-
 * function ship, brief 294/302 endgame -- documented "genuine wall",
 * no mnemonic .c will exist). Confirmed directly, lines 83-94:
 *   ldr r4, _LIT2          ; r4 = &data_ov011_021d3020 (_LIT2 = line
 *                            689; sole relocs.txt hit, relocs.txt:685
 *                            `from:0x021cee90 kind:load to:0x021d3020`)
 *   add r3, sp, #0x0
 *   mov r2, #0xa            ; loop count = 10
 * .L_28c:
 *   ldrb r1, [r4]           ; unsigned byte, pair[i][0]
 *   ldrb r0, [r4, #0x1]     ; unsigned byte, pair[i][1]
 *   add r4, r4, #0x2
 *   strb r1, [r3]
 *   strb r0, [r3, #0x1]
 *   add r3, r3, #0x2
 *   subs r2, r2, #0x1
 *   bne .L_28c
 * Both halves read via `ldrb` (zero-extending byte load) -> `unsigned
 * char`, matching the byte-pair-table convention already established by
 * the proven, structurally-identical (5 slots instead of 10) sibling
 * data_ov011_021d2fb4/_021d2fbe (see that file's header). All 20 values
 * are small (0x01-0x05), consistent with 1-based actor/view-slot index
 * pairs -- same value domain as the 5-slot siblings.
 *
 * .rodata ground truth (delinks.txt:2) -> `const`.
 */

const unsigned char data_ov011_021d3020[20] = {
    0x05, 0x03, 0x04, 0x02, 0x05, 0x03, 0x01, 0x04, 0x01, 0x05,
    0x04, 0x02, 0x05, 0x03, 0x02, 0x01, 0x03, 0x01, 0x04, 0x02,
};
