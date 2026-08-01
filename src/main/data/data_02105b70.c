typedef struct {
    char         pad_00[4];   /* +0x00-0x03: unconfirmed -- covered by CRC below but no direct consumer found */
    int          f04;         /* +0x04 */
    int          f08;         /* +0x08 */
    int          f0c;         /* +0x0c */
    char         pad_10[0xc]; /* +0x10-0x1b: unconfirmed -- +0x10 forwarded 3 calls deep as a
                               * provably dead argument; +0x14/+0x18 only reachable under an
                               * unresolved global "kind==2" dispatch shared with unrelated code */
    int          f1c;         /* +0x1c */
    char         pad_20[4];   /* +0x20-0x23: unconfirmed, true gap */
    int          f24;         /* +0x24: cross-confirmed by matched func_02053544.c's own `f_24` */
    char         pad_28[0x14];/* +0x28-0x3b: unconfirmed, true gap */
    unsigned int crc32;       /* +0x3c: CRC-32/IEEE (poly 0xedb88320) over bytes 0x0-0x3b,
                               * verified by func_02053114 */
} Packet02105b70;

Packet02105b70 data_02105b70;
