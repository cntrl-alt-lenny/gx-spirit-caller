typedef struct {
    int   state;      /* +0x00 */
    int   counter;    /* +0x04: anim/frame timer, clamped 0-0x180 */
    int   surface;    /* +0x08 */
    int   frame;      /* +0x0c */
    int   live;       /* +0x10 */
    char  label[18];  /* +0x14: OS_SPrintf(&label, "/card128/%04d.5bg", frame) */
    char  pad_26[0xe]; /* +0x26: unconfirmed, true gap */
    int   f34;        /* +0x34 */
    int   f38;        /* +0x38 */
    void *f3c;        /* +0x3c: pointer, own +0x2c deref'd elsewhere */
    int   f40;        /* +0x40: handle (func_0201ed3c ret) */
    int   f44;        /* +0x44: handle (func_0201ed74 ret) */
} Ov009EntryPanel;    /* 0x48 (72) bytes */

Ov009EntryPanel data_ov009_021adc00;
