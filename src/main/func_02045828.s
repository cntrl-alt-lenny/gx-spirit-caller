; func_02045828 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dad0
        .extern func_0203cd38
        .extern func_0204525c
        .extern func_0204548c
        .extern func_020454cc
        .extern func_020945f4
        .global func_02045828
        .arm
func_02045828:
    stmfd sp!, {lr}
    sub sp, sp, #0xc
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_31c
    ldrh r0, [r0, #0x4]
    cmp r0, #0x1
    addne sp, sp, #0xc
    ldmnefd sp!, {pc}
    add r0, sp, #0x0
    mov r1, #0x0
    mov r2, #0xc
    bl func_020945f4
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
    bl func_0203cd38
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmnefd sp!, {pc}
    mov r0, #0x9
    mvn r1, #0x5
    bl func_0204525c
    add sp, sp, #0xc
    ldmfd sp!, {pc}
.L_31c:
    mov r0, #0x9
    mvn r1, #0x3
    bl func_0204525c
    add sp, sp, #0xc
    ldmfd sp!, {pc}
_LIT0: .word data_0219dad0
_LIT1: .word func_020454cc
_LIT2: .word func_0204548c
