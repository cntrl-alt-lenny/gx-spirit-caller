/* func_02072544: 4-stage AND-chain guard, each stage recorded into its own
 * pre-zeroed flag and only evaluated if the previous stage's flag was set.
 * Stage 1: a2->byte8 isn't 0xa or 0xb. Stage 2: a2->half_a matches
 * byteswap16(a1->half_2). Stage 3: a2->half_18 matches
 * byteswap16(a1->half_0). Stage 4 (result): a2->word_1c matches the two
 * byte-swapped halfwords from a0 packed into one 32-bit value. */

typedef struct {
    unsigned short half_0;
    unsigned short half_2;
} A1_02072544_t;

typedef struct {
    unsigned char _pad_00[0x8];
    unsigned char byte8;
    unsigned char _pad_9[1];
    unsigned short half_a;
    unsigned char _pad_c[0xc];
    unsigned short half_18;
    unsigned char _pad_1a[2];
    unsigned int word_1c;
} A2_02072544_t;

typedef struct {
    unsigned char _pad_00[0xc];
    unsigned short half_c;
    unsigned short half_e;
} A0_02072544_t;

int func_02072544(A0_02072544_t *a0, A1_02072544_t *a1, A2_02072544_t *a2) {
    int result = 0;
    int stage3 = 0;
    int stage2 = 0;
    int stage1 = 0;

    if (a2->byte8 != 0xa && a2->byte8 != 0xb) {
        stage1 = 1;
    }
    if (stage1 != 0) {
        unsigned short h2 = a1->half_2;
        if (a2->half_a == (unsigned short)((h2 >> 8) | (h2 << 8))) {
            stage2 = 1;
        }
    }
    if (stage2 != 0) {
        unsigned short h0 = a1->half_0;
        if (a2->half_18 == (unsigned short)((h0 >> 8) | (h0 << 8))) {
            stage3 = 1;
        }
    }
    if (stage3 != 0) {
        unsigned short c = a0->half_c;
        unsigned short e = a0->half_e;
        if (a2->word_1c ==
            (((unsigned int)(unsigned short)((c >> 8) | (c << 8)) << 16) |
             (unsigned short)((e >> 8) | (e << 8)))) {
            result = 1;
        }
    }
    return result;
}
