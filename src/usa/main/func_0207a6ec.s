; func_0207a6ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207ae40
        .extern func_0207af50
        .extern func_0207b054
        .global func_0207a6ec
        .arm
func_0207a6ec:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldrh r0, [r0, #0x2]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_9c0
    b .L_988
    b .L_9b0
    b .L_9c0
    b .L_9c0
    b .L_9c0
.L_988:
    mov r0, #0x3
    bl func_0207af50
    mov r0, #0x0
    ldr r3, _LIT0
    mov r1, r0
    mov r2, r0
    bl func_0207b054
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_9b0:
    bl func_0207ae40
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_9c0:
    mov r0, #0xb
    bl func_0207af50
    mov r1, #0x0
    ldr r3, _LIT1
    mov r2, r1
    mov r0, #0x7
    bl func_0207b054
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word 0x00000783
_LIT1: .word 0x00000793
