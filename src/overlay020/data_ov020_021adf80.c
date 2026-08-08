/* data_ov020_021adf80 (28 bytes, 4-aligned): Ov020StepFn dispatch table
 * (6 slots + NULL sentinel), sibling of data_ov018_021ad71c / data_ov021_
 * 021abea0 / data_ov022_021ab9bc (same project-wide state-cursor dispatch
 * idiom). Data half of the already-matched consumer
 * src/overlay020/func_ov020_021ada1c.c, which declares
 * `extern Ov020StepFn data_ov020_021adf80[];` and does
 * `fn = data_ov020_021adf80[data_021040ac.fb6c]`. All 6 targets are still
 * raw .s in ov020 (func_ov020_021abbe8/021ac394/021ac4fc/021ac71c/
 * 021ad780/021ad910), each individually relocs.txt-proven:
 *   relocs.txt:411 from:0x021ada68 kind:load to:0x021adf80 (table base)
 *   relocs.txt:424-429 from:0x021adf80/84/88/8c/90/94 to:
 *     0x021abbe8 / 0x021ac394 / 0x021ac4fc / 0x021ac71c / 0x021ad780 /
 *     0x021ad910 (all module:overlay(20))
 * Immediately preceded by the already-shipped data_ov020_021adf68.c
 * (.data 0x021adf68-0x021adf80), confirming the boundary.
 * Section: .data (delinks.txt 0x021adde0-0x021ae060) -> NOT const.
 */

typedef int (*Ov020StepFn)(void);

extern char func_ov020_021abbe8;
extern char func_ov020_021ac394;
extern char func_ov020_021ac4fc;
extern char func_ov020_021ac71c;
extern char func_ov020_021ad780;
extern char func_ov020_021ad910;

Ov020StepFn data_ov020_021adf80[7] = {
    (Ov020StepFn)&func_ov020_021abbe8,
    (Ov020StepFn)&func_ov020_021ac394,
    (Ov020StepFn)&func_ov020_021ac4fc,
    (Ov020StepFn)&func_ov020_021ac71c,
    (Ov020StepFn)&func_ov020_021ad780,
    (Ov020StepFn)&func_ov020_021ad910,
    0,
};
