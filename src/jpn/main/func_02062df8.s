; func_02062df8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0210145c
        .extern data_02101464
        .extern func_0205405c
        .extern func_020540cc
        .extern func_0206220c
        .extern func_020a6c60
        .global func_02062df8
        .arm
func_02062df8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r0, [r5, #0x60]
    bl func_020540cc
    mov r4, r0
    cmp r4, #0x0
    bgt .L_34
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r3, _LIT2
    mov r2, #0x0
    bl func_020a6c60
.L_34:
    ldr r0, [r5, #0x60]
    sub r1, r4, #0x1
    bl func_0205405c
    ldr r3, [r5, #0x50]
    ldr r1, [r0]
    ldr r2, [r0, #0x4]
    mov r0, r5
    add r1, r3, r1
    bl func_0206220c
    cmp r0, #0x0
    moveq r0, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x90]
    movne r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0210145c
_LIT1: .word data_02101464
_LIT2: .word 0x00000475
