; func_02040478 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219d9d4
        .extern func_0203fe78
        .extern func_020919d8
        .extern func_02091ae0
        .extern func_02091d24
        .extern func_02092844
        .global func_02040478
        .arm
func_02040478:
    stmfd sp!, {lr}
    sub sp, sp, #0xc
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r1, [r1]
    add r0, r1, r0
    bl func_02092844
    ldr r1, _LIT0
    mov r2, #0x0
    ldr r0, [r1]
    add r0, r0, #0x1000
    str r2, [r0, #0x3f0]
    ldr r1, [r1]
    add r0, r1, #0x1000
    ldr r0, [r0, #0x384]
    cmp r0, #0x0
    beq .L_e08
    ldr r0, _LIT2
    add r0, r1, r0
    bl func_02091ae0
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqfd sp!, {pc}
.L_e08:
    ldr r2, _LIT0
    ldr r0, _LIT2
    ldr lr, [r2]
    mov r3, #0x1000
    ldr r1, _LIT3
    str r3, [sp]
    mov ip, #0x10
    add r0, lr, r0
    add r3, lr, #0x1000
    str ip, [sp, #0x4]
    bl func_02091d24
    ldr r1, _LIT0
    ldr r0, _LIT2
    ldr r1, [r1]
    add r0, r1, r0
    bl func_020919d8
    add sp, sp, #0xc
    ldmfd sp!, {pc}
_LIT0: .word data_0219d9d4
_LIT1: .word 0x000013d8
_LIT2: .word 0x00001318
_LIT3: .word func_0203fe78
