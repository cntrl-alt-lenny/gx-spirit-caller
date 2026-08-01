/* data_ov009_021adc54 -- overlay-009 score/scene controller.
 * Constructed by func_ov009_021ab848, outer-stepped by func_ov009_021ab910
 * (3-state fade discriminant @+0x24) which delegates to func_ov009_021ac4d0
 * (4-state selection/animate/confirm discriminant @+0x28) while active,
 * drawn by func_ov009_021ab9f8, torn down by func_ov009_021ab8c8.
 * All 16 4-byte slots independently confirmed against matched C / shipped .s. */
typedef struct {
    int   count;      /* +0x00: LP/score count vs. data_02104f4c+0xa60 */
    int   touchId;    /* +0x04: touch-scroll-region handle (func_0201ef90/ef3c) */
    int   f8;         /* +0x08: 3rd word of the same func_0201ef90 registration
                       * triple; real field, never independently read back */
    void *view;       /* +0x0c: view/task ptr; view+0x2c = OAM table base
                       * (func_ov009_021ab9f8) */
    int   live;       /* +0x10: live flag (func_ov009_021ab8c8) */
    int   f14;        /* +0x14: paired flag, cleared with `live`; set-path
                       * not observed */
    unsigned int selection; /* +0x18: 8 packed 4-bit slot codes, -1=none */
    int   remaining;   /* +0x1c: remaining-picks countdown 7..0 */
    int   slot;         /* +0x20: confirmed duel-slot index, -1=none */
    int   sceneState;    /* +0x24: outer 3-state (0/1/2) */
    int   updateState;    /* +0x28: inner 4-state (0/1/2/3) */
    int   surface;          /* +0x2c: surface handle (func_020211c8) */
    int   tick;               /* +0x30: scratch tick-counter, reused
                                * across sub-machines */
    int   row;                  /* +0x34: grid row 0-3 */
    int   col;                    /* +0x38: grid col 0-3 */
    int   invalid;                  /* +0x3c: touch-OOB / invalid flag */
} Ov009ScoreCtrl;

Ov009ScoreCtrl data_ov009_021adc54;
