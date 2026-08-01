typedef struct {
    int   f0;    /* +0x00: word, read back as value, fed through func_0201f090 */
    int   f4;    /* +0x04: word, read back as value */
    void *obj;   /* +0x08: pointer, own +0x2c deref'd in func_ov014_021b4040.c */
    int   task0; /* +0x0c: task handle (func_0201ed3c ret) */
    int   task1; /* +0x10: task handle (func_0201ed74 ret) */
} Ov014PaneSlot; /* 0x14 (20) bytes */

typedef struct {
    int            ready;      /* +0x00: one-time init guard */
    Ov014PaneSlot  slots[4];   /* +0x04: flags per-slot 0x0/0x6000/0xa000/0x12000 */
    unsigned short label54;    /* +0x54: packed byte-pair, explicit masks not bitfields */
    unsigned short label56;    /* +0x56: packed byte-pair */
    int            flags;      /* +0x58: bit0/bit1 tested by func_ov014_021b41b8.s */
} Ov014PaneBController;        /* 0x5c (92) bytes */

Ov014PaneBController data_ov014_022350f4;
