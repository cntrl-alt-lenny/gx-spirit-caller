/* data_ov004_0229164e alone starts at 0x0229164e, not 4-aligned -- paired
 * with its immediately-preceding, independently-referenced neighbor
 * (data_ov004_0229164c, itself 4-aligned) in one TU per the established
 * alignment-pairing fix (cm-bss-convert-2). Both keep their own name/type;
 * neither depends on the other's placement (each is passed by its own
 * pointer to an opaque generic copy/keyed-crc routine, never cross-
 * addressed), so mwldarm's lack of intra-TU order guarantee (also
 * cm-bss-convert-2) does not apply here. */
char data_ov004_0229164c[2];
char data_ov004_0229164e[98];
