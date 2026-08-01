typedef struct {
    int   mode;        /* +0x00: 0/nonzero selects between two coordinate-pair interpretations */
    int   f4;          /* +0x04 */
    int   f8;          /* +0x08 */
    int   fc;          /* +0x0c */
    int   f10;         /* +0x10 */
    int   f14;         /* +0x14: active/result-ready flag */
    int   zoneState;   /* +0x18: 0-5 enum, cross-confirmed writer+reader */
    int   tick;        /* +0x1c: counter, wraps mod ~0x14 */
    int   f20;         /* +0x20 */
    int   f24;         /* +0x24 */
    int   f28;         /* +0x28 */
    int   f2c;         /* +0x2c */
    int   f30;         /* +0x30 */
    short zones[5][4];  /* +0x34-0x5b: verbatim copy of data_ov005_021b158c;
                         * zones[4][2..3] (+0x58/+0x5a) written but read by no
                         * traced consumer -- unconfirmed */
} Ov005CardListAnim;

Ov005CardListAnim data_ov005_021b1d4c;
