; func_ov002_02286fbc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_0227d9a8
        .global func_ov002_02286fbc
        .arm
func_ov002_02286fbc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0227d9a8
    cmp r0, #0x2
    movge r0, #0x1
    ldmgeia sp!, {r4, pc}
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r3, r2, r0
    ldr r1, [r1, r3]
    cmp r1, #0x3e8
    ble .L_108
    ldr r1, [r4, #0x14]
    sub r0, r0, #0x28c
    mov r1, r1, lsl #0x10
    cmp r0, r1, lsr #0x10
    bhi .L_110
.L_108:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_110:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
