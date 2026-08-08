/* data_ov022_021ab9bc (28 bytes, 4-aligned): Ov022StepFn dispatch table
 * (6 slots + NULL sentinel), sibling of data_ov018_021ad71c / data_ov020_
 * 021adf80 / data_ov021_021abea0 (same project-wide state-cursor dispatch
 * idiom). Last symbol in ov022's .data section, immediately preceded by
 * the already-shipped data_ov022_021ab9a0.c (.data 0x021ab9a0-0x021ab9bc),
 * confirming the start boundary exactly. Data half of the already-matched
 * consumer src/overlay022/func_ov022_021ab460.c, which declares
 * `extern Ov022StepFn data_ov022_021ab9bc[];` and does
 * `fn = data_ov022_021ab9bc[data_021040ac.fb6c]`. All 6 targets are still
 * raw .s in ov022 (func_ov022_021aa758/021aaa34/021aabe8/021aadf0/
 * 021ab330/021ab3f0), each individually relocs.txt-proven:
 *   relocs.txt:139 from:0x021ab4ac kind:load to:0x021ab9bc (table base)
 *   relocs.txt:154-159 from:0x021ab9bc/c0/c4/c8/cc/d0 to: 0x021aa758 /
 *     0x021aaa34 / 0x021aabe8 / 0x021aadf0 / 0x021ab330 / 0x021ab3f0
 *     (all module:overlay(22))
 * ov022 has no _core.h; this table and its consumer were cross-referenced
 * directly against config/eur/arm9/overlays/ov022/delinks.txt +
 * relocs.txt, per this wave's instructions for ov022.
 * Section: .data (delinks.txt 0x021ab9a0-0x021abaa0) -> NOT const.
 */

typedef int (*Ov022StepFn)(void);

extern char func_ov022_021aa758;
extern char func_ov022_021aaa34;
extern char func_ov022_021aabe8;
extern char func_ov022_021aadf0;
extern char func_ov022_021ab330;
extern char func_ov022_021ab3f0;

Ov022StepFn data_ov022_021ab9bc[7] = {
    (Ov022StepFn)&func_ov022_021aa758,
    (Ov022StepFn)&func_ov022_021aaa34,
    (Ov022StepFn)&func_ov022_021aabe8,
    (Ov022StepFn)&func_ov022_021aadf0,
    (Ov022StepFn)&func_ov022_021ab330,
    (Ov022StepFn)&func_ov022_021ab3f0,
    0,
};
