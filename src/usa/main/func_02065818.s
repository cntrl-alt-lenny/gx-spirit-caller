; func_02065818 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021014c0
        .extern data_021014dc
        .extern data_0219e878
        .extern data_0219e87c
        .extern data_0219e880
        .extern data_0219e884
        .extern func_020658c0
        .global func_02065818
        .arm
func_02065818:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    bne .L_fc
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r0, [r0]
    bl func_020658c0
    ldr r1, _LIT0
    str r0, [r1]
.L_fc:
    ldr r0, _LIT3
    ldr r0, [r0]
    cmp r0, #0x0
    bne .L_124
    ldr r0, _LIT4
    ldr r1, _LIT5
    ldr r0, [r0]
    bl func_020658c0
    ldr r1, _LIT3
    str r0, [r1]
.L_124:
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_144
    ldr r0, _LIT3
    ldr r0, [r0]
    cmp r0, #0x0
    bne .L_150
.L_144:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmfd sp!, {pc}
.L_150:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219e884
_LIT1: .word data_0219e87c
_LIT2: .word data_021014c0
_LIT3: .word data_0219e880
_LIT4: .word data_0219e878
_LIT5: .word data_021014dc
