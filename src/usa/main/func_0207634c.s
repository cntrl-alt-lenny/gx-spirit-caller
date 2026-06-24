; func_0207634c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101e38
        .extern data_02101e40
        .extern func_02077d70
        .extern func_02077de4
        .extern func_02077ea4
        .extern func_02094500
        .global func_0207634c
        .arm
func_0207634c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x30
    mov r6, r0
    ldrb r0, [r6, #0x454]
    mov r5, r1
    add r4, r6, #0x3a4
    eors r0, r0, r2
    beq .L_34
    ldr r1, _LIT0
    mov r0, r4
    mov r2, #0x4
    bl func_02077de4
    b .L_44
.L_34:
    ldr r1, _LIT1
    mov r0, r4
    mov r2, #0x4
    bl func_02077de4
.L_44:
    mov r0, r4
    mov r1, r6
    mov r2, #0x30
    bl func_02077de4
    add r0, sp, #0x0
    mov r1, #0x36
    mov r2, #0x30
    bl func_02094500
    add r1, sp, #0x0
    mov r0, r4
    mov r2, #0x30
    bl func_02077de4
    mov r0, r4
    mov r1, r5
    bl func_02077d70
    mov r0, r4
    bl func_02077ea4
    mov r1, r6
    mov r0, r4
    mov r2, #0x30
    bl func_02077de4
    add r0, sp, #0x0
    mov r1, #0x5c
    mov r2, #0x30
    bl func_02094500
    mov r0, r4
    add r1, sp, #0x0
    mov r2, #0x30
    bl func_02077de4
    mov r0, r4
    mov r1, r5
    mov r2, #0x10
    bl func_02077de4
    mov r0, r4
    mov r1, r5
    bl func_02077d70
    add sp, sp, #0x30
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_02101e38
_LIT1: .word data_02101e40
