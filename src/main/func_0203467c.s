; func_0203467c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02031c1c
        .extern func_02031d0c
        .extern func_02031d80
        .extern func_02034184
        .extern func_02034548
        .extern func_02034574
        .extern func_020345c0
        .extern func_02034754
        .global func_0203467c
        .arm
func_0203467c:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    bl func_02034184
    cmp r0, #0x0
    beq .L_e4
    ldr r2, [r0, #0x10]
    add sp, sp, #0x4
    ldr r1, [r0, #0x14]
    mov r0, r2
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_e4:
    ldr r0, _LIT0
    mov r1, #0x200000
    mov r2, #0x5000000
    bl func_02031d80
    movs r4, r0
    beq .L_158
    ldr r1, _LIT0
    bl func_02034754
    ldr ip, _LIT1
    ldr r3, _LIT2
    mov r0, r4
    mov r1, #0x200000
    mov r2, #0x5000000
    str ip, [sp]
    bl func_02031c1c
    mov r6, r1
    mov r5, r0
    cmp r6, #0x0
    cmpeq r5, #0x0
    beq .L_144
    mov r0, r4
    bl func_020345c0
    cmp r0, #0x0
    bge .L_160
.L_144:
    mov r0, r4
    bl func_02031d0c
    mov r5, #0x0
    mov r6, r5
    b .L_160
.L_158:
    mov r5, #0x0
    mov r6, r5
.L_160:
    mov r0, r5
    mov r1, r6
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word 0x0000048c
_LIT1: .word func_02034574
_LIT2: .word func_02034548
