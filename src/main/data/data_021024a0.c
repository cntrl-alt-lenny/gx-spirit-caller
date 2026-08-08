/* data_021024a0 (16 bytes, 4-aligned): OSi_PostIrqEvent slot -> IRQ
 * bit-shift table (8 x u16). The consumer builds `mask = 1 <<
 * data_021024a0[idx]` for idx 0-7, i.e. this maps an IRQ-event slot to
 * a hardware IRQ bit position; values 8-11 and 3-6 line up with the NDS
 * OS_IE bit assignments for DMA0-3 (bits 8-11) and Timer0-3 (bits 3-6).
 * Consumer: src/main/OSi_PostIrqEvent.legacy.c:90 (extern decl at :85)
 * (relocs.txt:16279 from:0x02090560 kind:load to:0x021024a0 module:main).
 * Not const: original section is .data (delinks.txt line 4), not .rodata.
 */
unsigned short data_021024a0[8] = {
    0x0008, 0x0009, 0x000a, 0x000b, 0x0003, 0x0004, 0x0005, 0x0006,
};
