/* func_ov011_021ce4d4: three field RMWs on data_021d4000 in store order:
 *   [0x2a4] |= 0x10;  [0x2c4] = 0;  [0x2b0] = ([0x2b0] & 0xffe01fff) | 0x8000
 * Base held in one reg across all accesses (single pool word). Modeled as
 * struct-member access (not pointer-cast) so mwcc keeps [base,#off]
 * addressing instead of folding the offset into the pool constant. */
struct Ov011ViewState4000 {
    char pad0[0x2a4];
    unsigned int flags_2a4;
    char pad1[0x2b0 - 0x2a4 - 4];
    unsigned int field_2b0;
    char pad2[0x2c4 - 0x2b0 - 4];
    unsigned int field_2c4;
};
extern struct Ov011ViewState4000 data_ov011_021d4000;

void func_ov011_021ce4d4(void) {
    data_ov011_021d4000.flags_2a4 |= 0x10;
    data_ov011_021d4000.field_2c4 = 0;
    data_ov011_021d4000.field_2b0 = (data_ov011_021d4000.field_2b0 & 0xffe01fffu) | 0x8000;
}
