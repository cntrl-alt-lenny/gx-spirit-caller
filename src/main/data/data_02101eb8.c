/* data_02101eb8 (12 bytes, 4-aligned): IEEE 802.2 LLC/SNAP encapsulation
 * header + EtherType(IPv4), used to wrap/unwrap IP frames over 802.11
 * (Nintendo DWC Wi-Fi link layer).
 *   [0]    dsap    = 0xAA
 *   [1]    ssap    = 0xAA
 *   [2]    control = 0x03
 *   [3..5] oui     = 00:00:00
 *   [6..7] ethertype (big-endian) = 0x0800 (IPv4)
 * 3 readers (matches census exactly): func_02073318
 * (src/main/func_02073318.s:79-80,97; relocs.txt from:0x02073448) copies
 * all 8 bytes into an outgoing frame; func_02073ac0 (.s:39-58,174;
 * relocs.txt from:0x02073d24) validates an incoming buffer's bytes [0..2]
 * against this table and bytes [6..7] against literals 0x08/{0x00,0x06}
 * (IPv4 or ARP); func_02073d30 (.s:22-27,40; relocs.txt from:0x02073d98)
 * reuses the 6-byte SNAP-only prefix. Bytes 8-11 are unreferenced by any
 * known consumer.
 * Not const: original section is .data (delinks.txt line 4), not .rodata.
 */
unsigned char data_02101eb8[12] = {
    0xaa, 0xaa, 0x03, 0x00, 0x00, 0x00, 0x08, 0x00,
    0x00, 0x00, 0x00, 0x00,
};
