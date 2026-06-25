; func_02045780 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219d9f0
        .extern func_0203cce8
        .extern func_0204520c
        .extern func_0204543c
        .extern func_0204547c
        .extern func_02094500
        .global func_02045780
        .arm
func_02045780:
    stmfd sp!, {lr}
    sub sp, sp, #0xc
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_90
    ldrh r0, [r0, #0x4]
    cmp r0, #0x1
    addne sp, sp, #0xc
    ldmnefd sp!, {pc}
    add r0, sp, #0x0
    mov r1, #0x0
    mov r2, #0xc
    bl func_02094500
    ldr r0, _LIT0
    ldr r3, _LIT1
    ldr lr, [r0]
    ldr r2, _LIT2
    ldrh ip, [lr, #0x8]
    add r0, sp, #0x0
    mov r1, #0x2
    strb ip, [sp, #0x8]
    ldrh ip, [lr, #0xa]
    strb ip, [sp, #0x9]
    str r3, [sp]
    str r2, [sp, #0x4]
    strh r1, [lr, #0x4]
    bl func_0203cce8
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmnefd sp!, {pc}
    mov r0, #0x9
    mvn r1, #0x5
    bl func_0204520c
    add sp, sp, #0xc
    ldmfd sp!, {pc}
.L_90:
    mov r0, #0x9
    mvn r1, #0x3
    bl func_0204520c
    add sp, sp, #0xc
    ldmfd sp!, {pc}
_LIT0: .word data_0219d9f0
_LIT1: .word func_0204547c
_LIT2: .word func_0204543c
