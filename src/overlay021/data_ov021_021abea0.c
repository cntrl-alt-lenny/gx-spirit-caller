/* data_ov021_021abea0 (24 bytes, 4-aligned): Ov021StepFn dispatch table
 * (5 slots + NULL sentinel), first symbol in ov021's .data section. Data
 * half of the already-matched consumer src/overlay021/func_ov021_021aa4a0.c,
 * which declares `extern Ov021StepFn data_ov021_021abea0[];` and does
 * `fn = data_ov021_021abea0[data_ov021_021ace80.idx]`. Unlike the ov018/
 * ov020/ov022 siblings, all 5 targets are already-matched .c functions with
 * confirmed `int (void)` signatures (verified by reading each): Audio_Init
 * (src/overlay021/Audio_Init.c), func_ov021_021aa5a0, func_ov021_021aa898,
 * func_ov021_021aa8d4, Scene_Update (src/overlay021/Scene_Update.c) --
 * symbols.txt confirms the two renamed names exactly (`Audio_Init
 * addr:0x021aa514`, `Scene_Update addr:0x021aa908`). Each individually
 * relocs.txt-proven:
 *   relocs.txt:3 from:0x021aa508 kind:load to:0x021abea0 (table base, in
 *     func_ov021_021aa4a0's own literal pool)
 *   relocs.txt:272-276 from:0x021abea0/a4/a8/ac/b0 to: 0x021aa514 /
 *     0x021aa5a0 / 0x021aa898 / 0x021aa8d4 / 0x021aa908 (module:overlay(21))
 * Self-consistent as a state machine: func_ov021_021aa5a0 sets the cursor
 * (`data_ov021_021ace80[0]`, the same storage as `.idx`) to 5 -- out of the
 * 5 real slots (0-4) but exactly the index of this table's own NULL
 * sentinel, i.e. entry [5] deliberately reads 0 and the dispatcher falls
 * through to its `GlobalAudioStateF24View.f24` completion gate. This
 * confirms the size is exactly 6 words (5 fn-ptrs + 1 NULL), not more.
 * extern char + cast (D-1 recipe), even though real prototypes are known,
 * to match this project's uniform dispatch-table convention.
 * Section: .data (delinks.txt 0x021abea0-0x021ace80) -> NOT const.
 */

typedef int (*Ov021StepFn)(void);

extern char Audio_Init;
extern char func_ov021_021aa5a0;
extern char func_ov021_021aa898;
extern char func_ov021_021aa8d4;
extern char Scene_Update;

Ov021StepFn data_ov021_021abea0[6] = {
    (Ov021StepFn)&Audio_Init,
    (Ov021StepFn)&func_ov021_021aa5a0,
    (Ov021StepFn)&func_ov021_021aa898,
    (Ov021StepFn)&func_ov021_021aa8d4,
    (Ov021StepFn)&Scene_Update,
    0,
};
