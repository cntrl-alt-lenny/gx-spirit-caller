/* Covers data_ov006_021cf1b0 (4173 B, evidenced) + data_ov006_021d01fd
 * (2303 B, no real consumer -- see cm-bss-convert-2) as one TU so the
 * combined 6476 B exit boundary is 4-byte aligned. mwldarm does not
 * preserve declaration order for multiple .bss tentative definitions in
 * one TU, so the two symbols cannot be reliably placed at their separate
 * original addresses within one file; data_ov006_021d01fd has no named
 * consumer to preserve. */
char data_ov006_021cf1b0[6476];
