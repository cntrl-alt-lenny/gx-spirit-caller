/* Brief 181 — wave-2 single-int TU rewrite to absorb the value=0
 * deferred candidate `data_021021e4` (cluster B W6-rejected residue
 * deferred from brief 155 PR #584).
 *
 * Bundle covers [0x021021e0..0x021021e8) = 8 bytes. Originally a
 * 4-byte single-int TU (brief 143 wave 1) holding `0x2a`; extended
 * to absorb the adjacent 4-byte value=0 placeholder so it lands in
 * .data instead of mwcc-routing to .bss.
 *
 * patch_module_literals.py resolves the absorbed-placeholder
 * kind:load reloc post-link on arm9.bin (per brief 152's worked-
 * example mechanism).
 *
 * Subsumed placeholder + its kind:load reloc origin:
 *   - 0x021021e4: from 0x02082c20
 */

unsigned int data_021021e0[2] = {
    0x0000002a,
    0x00000000,
};
