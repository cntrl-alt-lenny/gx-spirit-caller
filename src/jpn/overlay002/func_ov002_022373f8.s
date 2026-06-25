; func_ov002_022373f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021de318
        .extern func_ov002_021df728
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_021e952c
        .extern func_ov002_02257668
        .global func_ov002_022373f8
        .arm
func_ov002_022373f8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_021e2a4c
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r2, #0x12c
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_021df728
    ldr r1, _LIT0
    mov r0, r4
    bl func_ov002_02257668
    mov r1, r0
    mov r0, r4
    bl func_ov002_021de318
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word func_ov002_021e952c
