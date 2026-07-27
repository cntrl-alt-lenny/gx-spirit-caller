/* data_020bec8c -- single default/template struct instance (88 bytes,
 * 4-aligned).
 *
 * Sole consumer func_0203edd4.s: unconditionally bulk-copies all 88
 * bytes (`mov r2,#0x58; bl func_02094688`, memcpy-shaped, length ==
 * sizeof) into a destination struct, then unconditionally overwrites
 * destination offsets 0x4,0x8,0xc,0x10,0x14,0x18,0x1c,0x20 with computed
 * values on both code paths -- proving those 8 fields are real 4-byte
 * fields (width proven by the stores) whose BLOB-supplied defaults are
 * inert for this call site, not proof of a specific default value's
 * meaning. Record count = 1: the whole-blob copy length is a compile-
 * time constant equal to sizeof, with zero indexing anywhere.
 *
 * Only offset 0x48 has independent evidence beyond width/emptiness:
 * relocs.txt shows a real relocation from this exact offset to
 * data_020fe4d0 (`from:0x020becd4 kind:load to:0x020fe4d0`), confirming
 * a genuine embedded pointer -- reproduced here via a real extern
 * reference (not a raw literal cast) since the ORIGINAL rom used a real
 * relocation at this offset, unlike the ov012 raw-literal-cast precedent
 * (data_ov012_021cc1e8) which was specifically justified by the
 * original having NO relocations there.
 *
 * Every other field (unk_00/24/28, reserved[7], count_4c, unk_50/54) is
 * NEVER read or written by the sole consumer -- kept at 4-byte-word
 * granularity (matching the file's own "4-aligned" note and the fact
 * every nonzero byte in the blob lands on a word boundary) but with no
 * semantic meaning claimed. See docs/research/data/cm-data-inference-4-2026-07-25.md.
 */

extern char data_020fe4d0;

typedef struct {
    unsigned int unk_00;      /* 0x00 -- never read; default 0x01000000 */
    unsigned int field_04;    /* 0x04 -- unconditionally overwritten; blob default dead */
    unsigned int field_08;    /* 0x08 -- unconditionally overwritten; blob default dead */
    unsigned int flag_0c;     /* 0x0c -- unconditionally overwritten; blob default dead */
    unsigned int field_10;    /* 0x10 -- unconditionally overwritten; blob default dead */
    unsigned int field_14;    /* 0x14 -- unconditionally overwritten; blob default dead */
    unsigned int field_18;    /* 0x18 -- unconditionally overwritten; blob default dead */
    unsigned int field_1c;    /* 0x1c -- unconditionally overwritten; blob default dead */
    unsigned int field_20;    /* 0x20 -- unconditionally overwritten; blob default dead */
    unsigned int unk_24;      /* 0x24 -- never read; default 0x1000 */
    unsigned int unk_28;      /* 0x28 -- never read; default 0x1000 */
    unsigned int reserved[7]; /* 0x2c-0x44 -- never read; all zero */
    void *ptr_48;              /* 0x48 -- CONFIRMED via relocs.txt */
    unsigned int count_4c;    /* 0x4c -- never independently read; positionally
                                  paired with ptr_48 but not consumer-proven */
    unsigned int unk_50;      /* 0x50 -- never read; zero */
    unsigned int unk_54;      /* 0x54 -- never read; zero */
} Template020bec8c;            /* sizeof == 0x58 == 88 */

const Template020bec8c data_020bec8c = {
    .unk_00 = 0x01000000,
    .field_04 = 0, .field_08 = 0, .flag_0c = 1,
    .field_10 = 0, .field_14 = 0, .field_18 = 0, .field_1c = 0, .field_20 = 0,
    .unk_24 = 0x1000, .unk_28 = 0x1000,
    .reserved = { 0, 0, 0, 0, 0, 0, 0 },
    .ptr_48 = &data_020fe4d0,
    .count_4c = 4,
    .unk_50 = 0, .unk_54 = 0,
};
