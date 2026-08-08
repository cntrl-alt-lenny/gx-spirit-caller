/* data_020c78f0 (24 bytes, 4-aligned): resource-manifest header record.
 * Consumer: src/overlay021/func_ov021_021aaadc.c:12,22 (already-matched C,
 * "Ov021_BuildGlyphLayout" per docs/research/map/overlay007.md/NAMES.md)
 * -- `*(int *)o = func_020211c8(data_020c78f0);`, treats it as an opaque
 * resource base pointer, no per-field access visible in this consumer.
 * relocs.txt: offset+0x04 -> 0x020c7908 (= this symbol's own end
 * address, self+0x18); offset+0x0c -> 0x020c7a04. Both already have
 * kind:data(any) placeholder names. Offsets 0x00/0x08/0x10/0x14 have no
 * relocations. Field labels (tag/count) are inferred from the symmetric
 * 0xf1/0xf0 high-byte pattern and payload-pointer positioning, not
 * consumer-proven -- the one known reader doesn't dereference individual
 * fields.
 * Not const: original section is .data (delinks.txt line 4), not .rodata.
 */
extern char data_020c7908[];
extern char data_020c7a04[];

typedef struct {
    unsigned int tag_start;  /* +0x00, 0xf1000000 observed (tag byte 0xf1 in top byte) */
    void        *payload_a;  /* +0x04, points to self+0x18 (payload follows header) */
    unsigned int count_a;    /* +0x08, observed 6 */
    void        *payload_b;  /* +0x0c, points to data_020c7a04 */
    unsigned int count_b;    /* +0x10, observed 4 */
    unsigned int tag_end;    /* +0x14, 0xf0000000 observed (tag byte 0xf0 in top byte) */
} data_020c78f0_t;

data_020c78f0_t data_020c78f0 = { 0xf1000000, &data_020c7908, 6, &data_020c7a04, 4, 0xf0000000 };
