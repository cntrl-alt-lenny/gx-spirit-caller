/* func_0203edd4: template-init an output record, copy two words from a0,
 * then look up an entry (0x100-byte stride) in a1's table by a
 * validated index and fan its sub-fields out into the output record --
 * or zero them if the entry's "active" byte is clear. */

extern void func_02094688(void *dst, void *src, int n);
extern int func_0203c814(int a0);
extern int func_0203ed80(void *a0);
extern int func_0203ed2c(int a0);

extern unsigned char data_020bec8c[0x58];

struct S0203edd4_A0 {
    int f_0;   /* +0x0 */
    int f_4;   /* +0x4 */
};

struct S0203edd4_A2 {
    unsigned char _pad_00[0x4];
    int f_4;    /* +0x4 */
    int f_8;    /* +0x8 */
    int f_c;    /* +0xc */
    int f_10;   /* +0x10 */
    int f_14;   /* +0x14 */
    int f_18;   /* +0x18 */
    int f_1c;   /* +0x1c */
    int f_20;   /* +0x20 */
};

struct S0203edd4_A1 {
    unsigned char _pad_00[0xd0d];
    unsigned char f_d0d;   /* +0xd0d */
};

struct S0203edd4_Entry {
    unsigned char _pad_00[0xc0];
    unsigned char f_c0;                     /* +0xc0 */
    unsigned char _pad_c1[0xc4 - 0xc1];
    unsigned char f_c4;                        /* +0xc4 */
    unsigned char _pad_c5[0xc8 - 0xc5];
    unsigned char f_c8;                           /* +0xc8 */
    unsigned char _pad_c9[0xcc - 0xc9];
    unsigned char f_cc;                              /* +0xcc */
    unsigned char _pad_cd[0xd0 - 0xcd];
    unsigned char f_d0;                                 /* +0xd0 */
};

void func_0203edd4(struct S0203edd4_A0 *a0, struct S0203edd4_A1 *a1, struct S0203edd4_A2 *a2) {
    struct S0203edd4_Entry *entry;
    unsigned int v;

    func_02094688(data_020bec8c, a2, 0x58);
    a2->f_4 = a0->f_0;
    a2->f_8 = a0->f_4;

    v = a1->f_d0d;
    if (v >= 6) {
        return;
    }

    v = func_0203c814(v);
    entry = (struct S0203edd4_Entry *)((unsigned char *)a1 + (v << 8));

    if (entry->f_c0 != 0) {
        a2->f_c = 0;
        a2->f_10 = func_0203ed80(&entry->f_c0);
        a2->f_14 = func_0203ed2c(entry->f_d0);
        a2->f_18 = func_0203ed80(&entry->f_c4);
        a2->f_1c = func_0203ed80(&entry->f_c8);
        a2->f_20 = func_0203ed80(&entry->f_cc);
    } else {
        a2->f_c = 1;
        a2->f_10 = 0;
        a2->f_14 = 0;
        a2->f_18 = 0;
        a2->f_1c = 0;
        a2->f_20 = 0;
    }
}
