typedef struct {
    unsigned char  block_a[0x20];   /* +0x00 */
    unsigned char  block_b[0x30];   /* +0x20 */
    unsigned int   packed;          /* +0x50 */
    unsigned int   key_w;           /* +0x54 */
    unsigned short key_h;           /* +0x58 */
    unsigned char  active;          /* +0x5a */
    unsigned char  _pad_5b;         /* +0x5b: unconfirmed by any consumer, required only as ABI tail-pad to reach the confirmed 0x5c stride */
} slot_t;

slot_t data_021a071c[4];
