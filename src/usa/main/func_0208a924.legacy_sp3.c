/* func_0208a924 — iterate 4 fixed-size records (stride 0x170) at the
 * global data_021a5c5c; for each, test bit 0 of the flags word at
 * +0x110 (signed :1 bitfield -> lsl#31/asr#31) and, if set, call
 * func_0208a77c(record, arg).
 *
 * The lsl#31;asr#31 pair is the signature of a signed 1-bit bitfield
 * read used in a truthiness test; a plain `& 1` would emit `and`/`tst`
 * instead.
 */
#include <nitro/types.h>

typedef struct Rec_0208aa0c {
    u8 _pad0[0x110];
    struct { s32 active : 1; } flags;   /* +0x110, signed :1 -> lsl/asr */
    u8 _pad114[0x170 - 0x114];
} Rec_0208aa0c;

extern Rec_0208aa0c data_021a5c5c[];
extern void func_0208a77c(Rec_0208aa0c *rec, int arg);

void func_0208a924(int arg) {
    int i;
    for (i = 0; i < 4; i++) {
        if (data_021a5c5c[i].flags.active) {
            func_0208a77c(&data_021a5c5c[i], arg);
        }
    }
}
