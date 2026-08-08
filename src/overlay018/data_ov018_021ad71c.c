/* data_ov018_021ad71c (28 bytes, 4-aligned): Ov018StepFn dispatch table
 * (6 slots + NULL sentinel), the data half of the already-matched
 * consumer src/overlay018/func_ov018_021ace14.c, which declares
 * `extern Ov018StepFn data_ov018_021ad71c[];` and does
 * `fn = data_ov018_021ad71c[data_021040ac.fb6c]`. Every non-zero word is a
 * real function start in ov018's own .text (delinks.txt-confirmed), each
 * individually relocs.txt-proven:
 *   relocs.txt:298 from:0x021ace64 kind:load to:0x021ad71c (table base,
 *     the literal pool of func_ov018_021ace14 itself)
 *   relocs.txt:309-314 from:0x021ad71c/720/724/728/72c/730 to:
 *     0x021ab1c4 / 0x021ab48c / 0x021ab4f4 / 0x021ab694 / 0x021accc8 /
 *     0x021acda0 (all module:overlay(18))
 * extern char + cast, matching this project's D-1 recipe precedent
 * (src/overlay006/data_ov006_021cbb08.c).
 * Section: .data (delinks.txt 0x021ad320-0x021ad860) -> NOT const, matches
 * the family precedent (dispatch tables are non-const throughout this
 * project even though logically read-mostly).
 */

typedef int (*Ov018StepFn)(void);

extern char func_ov018_021ab1c4;
extern char func_ov018_021ab48c;
extern char func_ov018_021ab4f4;
extern char func_ov018_021ab694;
extern char func_ov018_021accc8;
extern char func_ov018_021acda0;

Ov018StepFn data_ov018_021ad71c[7] = {
    (Ov018StepFn)&func_ov018_021ab1c4,
    (Ov018StepFn)&func_ov018_021ab48c,
    (Ov018StepFn)&func_ov018_021ab4f4,
    (Ov018StepFn)&func_ov018_021ab694,
    (Ov018StepFn)&func_ov018_021accc8,
    (Ov018StepFn)&func_ov018_021acda0,
    0,
};
