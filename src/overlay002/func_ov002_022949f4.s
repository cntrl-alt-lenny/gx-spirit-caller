; func_ov002_022949f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021bbf50
        .extern func_ov002_02294938
        .global func_ov002_022949f4
        .arm
func_ov002_022949f4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh r3, [r4, #0x2]
    ldr r0, _LIT0
    ldr r2, _LIT1
    mov r3, r3, lsl #0x1f
    mov ip, r3, lsr #0x1f
    and r3, ip, #0x1
    mul r0, r3, r0
    ldr r2, [r2, r0]
    ldr r0, _LIT2
    mov r5, r1
    cmp r2, r0
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, pc}
    rsb r0, ip, #0x1
    bl func_ov002_021bbf50
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r4
    mov r1, r5
    bl func_ov002_02294938
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00001770
