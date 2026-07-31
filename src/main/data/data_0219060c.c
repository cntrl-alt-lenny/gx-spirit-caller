/* Covers data_0219060c (4863 B, evidenced) + data_0219190b (1301 B, no
 * real consumer -- see cm-bss-convert-2) as one TU so the combined 6164 B
 * exit boundary is 4-byte aligned. mwldarm does not preserve declaration
 * order for multiple .bss tentative definitions in one TU, so the two
 * symbols cannot be reliably placed at their separate original addresses
 * within one file; data_0219190b has no named consumer to preserve. */
char data_0219060c[6164];
