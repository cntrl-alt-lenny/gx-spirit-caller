/* data_ov006_021cddec (16 bytes, 8 x signed int16): carved as a sibling
 * lead from cm-data-inference-3 -- referenced only as an `.extern` in
 * func_ov006_021c3384.s, one address below the already-shipped
 * data_ov006_021cdf88 (src/overlay006/data_ov006_021cdf88.c, an 8-record
 * DuelIconEntry[8] array).
 *
 * Evidence (single consumer, exhaustive): func_ov006_021c3384.s is the
 * ONLY reference anywhere in the EUR binary -- config/eur/arm9/overlays/
 * ov006/relocs.txt has exactly one relocation to this address
 * (`from:0x021c34b8 kind:load to:0x021cddec module:overlay(6)`, the
 * function's own literal-pool word), and a repo-wide grep of src/ (all
 * regions) finds no second consumer. The region port of this function,
 * func_ov006_021c5e38.s (src/usa|jpn/overlay006/), calls the shared
 * property-setter one fewer time per record (8 calls vs EUR's 9) and has
 * no equivalent of the property-0xe call below at all -- this table is
 * EUR-exclusive.
 *
 * In func_ov006_021c3384.s's 8-iteration loop (`mov r7,#0x0` .. `cmp
 * r7,#0x8 / blt`, the same loop that walks data_ov006_021cdf88 via
 * `add r9,r9,#0x1c` each iteration), the record index r7 is reused
 * against this table with an unconditional stride-2 computed index --
 * not masked, but hardware-bound by the loop's own `cmp r7,#0x8`, the
 * same bound already used to size data_ov006_021cdf88[8]:
 *
 *     mov r2, r7, lsl #0x1      ; idx*2 byte stride
 *     ldrsh r2, [r4, r2]        ; data_ov006_021cddec[idx], signed 16-bit
 *     mov r0, r6
 *     mov r1, #0xe              ; property 0xe, alongside the sibling
 *     bl func_020216b0          ; table's own icon-id properties 0xc/0xd/0x11/0x12
 *
 * 8 records x 2 bytes = 16 bytes, exactly the gap to the next symbol
 * (data_ov006_021cddfc) -- self-consistent with no slack. Declared
 * without `const` (matching data_ov006_021cdf88's own convention) so it
 * lands in `.data`, matching this entry's own delinks.txt section.
 */
short data_ov006_021cddec[8] = {
    0, 0, 2, 5, 9, 8, 4, 1,
};
