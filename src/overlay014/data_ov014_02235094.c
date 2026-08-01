typedef struct {
    int   f0;    /* +0x00: word, read back as value, fed through func_0201f090 */
    int   f4;    /* +0x04: word, read back as value */
    void *obj;   /* +0x08: pointer, own +0x2c deref'd in func_ov014_021b4040.c */
    int   task0; /* +0x0c: task handle (func_0201ed3c ret) */
    int   task1; /* +0x10: task handle (func_0201ed74 ret) */
} Ov014PaneSlot; /* 0x14 (20) bytes -- same shape as data_ov014_022350f4.c's own definition */

typedef struct {
    int           animState;   /* +0x00 */
    int           inputState;  /* +0x04 */
    int           slideTimer;  /* +0x08 */
    char          label[12];   /* +0x0c */
    char          pad_18[0x14]; /* +0x18: unconfirmed, true gap (within a proven zeroed block) */
    int           ready;       /* +0x2c */
    int           cursorIndex; /* +0x30 */
    int           hitState;    /* +0x34 */
    Ov014PaneSlot slot;        /* +0x38 */
} Ov014PaneAController;        /* 0x4c (76) bytes */

Ov014PaneAController data_ov014_02235094;
