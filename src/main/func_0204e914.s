; func_0204e914 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff9d4
        .extern data_020ff9dc
        .extern data_020ff9e4
        .extern func_0205538c
        .extern func_0209150c
        .extern func_02094688
        .extern func_020aaddc
        .global func_0204e914
        .arm
func_0204e914:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x208
    mov r7, r0
    mov r5, r2
    mov r4, r3
    mov r0, #0x3
    mov r6, r1
    str r0, [sp]
    ldr ip, _LIT0
    ldr r2, _LIT1
    ldr r3, _LIT2
    add r0, sp, #0x8
    mov r1, #0x200
    str ip, [sp, #0x4]
    bl func_0209150c
    add r1, sp, #0x8
    add r2, sp, #0x9
    strb r6, [r1, r0]
    mov r1, #0x0
    strb r1, [r2, r0]
    cmp r4, #0x0
    add r8, r2, r0
    beq .L_152c
    mov r0, r4
    bl func_020aaddc
    mov r6, r0
    mov r0, r4
    mov r1, r8
    mov r2, r6
    bl func_02094688
    mov r0, #0x0
    strb r0, [r8, r6]
.L_152c:
    add r2, sp, #0x8
    mov r0, r7
    mov r1, r5
    bl func_0205538c
    add sp, sp, #0x208
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_020ff9e4
_LIT1: .word data_020ff9d4
_LIT2: .word data_020ff9dc
