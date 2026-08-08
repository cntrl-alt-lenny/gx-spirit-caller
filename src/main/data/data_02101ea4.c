/* data_02101ea4 (8 bytes, 4-aligned): broadcast MAC address
 * (FF:FF:FF:FF:FF:FF) sentinel "route" record. func_02073838
 * (src/main/func_02073838.s:37-43,80; relocs.txt from:0x02073910) returns
 * &data_02101ea4 (address, not dereferenced value) for loopback/
 * global-broadcast/same-subnet/multicast IP destinations, using
 * func_02073ed8 and the already-landed func_02073e54 (multicast-nibble
 * predicate) to classify. Bytes 6-7 unreferenced by the one known
 * consumer.
 * Not const: original section is .data (delinks.txt line 4), not .rodata.
 */
unsigned char data_02101ea4[8] = {
    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00,
};
