typedef struct {
    int   state;      /* +0x00 */
    int   unk04;      /* +0x04 -- nibble-packed pair, idx 0 (func_ov016_021b5188) */
    int   unk08;      /* +0x08    init: random via func_ov016_021b3b14 */
    int   unk0C;      /* +0x0c -- nibble-packed pair, idx 1 */
    int   unk10;      /* +0x10    init: -1,-1 sentinel */
    int   counter14;  /* +0x14: decrementing counter */
    int   phaseSub18; /* +0x18: cyclic sub-phase */
    int   phaseCat1C; /* +0x1c: cyclic category phase, init=3 */
    int   unk20;      /* +0x20: gate; no writer found (relocs.txt-proven) */
    void *taskCountHolder24; /* +0x24: ptr to external {u16 count;...} */
    int   unk28;      /* +0x28: opaque; no writer found */
    void *taskSlots2C[3]; /* +0x2c: task/object handles (func_0201f090) */
    void *handle38[2];    /* +0x38: task handles (func_0201ef90/4204) */
} SubsysB021babec;  /* sizeof == 0x40 */

SubsysB021babec data_ov016_021babec;
