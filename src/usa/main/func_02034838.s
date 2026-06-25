; func_02034838 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201ccc8
        .extern func_02031e58
        .extern func_02031fd4
        .extern func_020320a4
        .extern func_020325e0
        .extern func_02034834
        .extern func_02046a58
        .extern func_02094688
        .global func_02034838
        .arm
func_02034838:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r7, r0
    mov r4, r1
    mov r6, r2
    bl func_020325e0
    cmp r0, #0x1
    beq .L_2c
    cmp r0, #0x2
    beq .L_44
    b .L_b0
.L_2c:
    mov r0, r7
    mov r1, r4
    mov r2, r6
    bl func_0201ccc8
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_44:
    bl func_02031e58
    mov r1, r6
    bl func_02031fd4
    mov r5, r0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_02094688
    bl func_02031e58
    mov r4, r0
    bl func_02046a58
    str r6, [sp]
    mov r1, r7, lsl #0x10
    mov r2, r0
    ldr ip, _LIT0
    str r5, [sp, #0x4]
    mov r1, r1, lsr #0x10
    mov r0, r4
    mov r3, #0x0
    str ip, [sp, #0x8]
    bl func_020320a4
    mvn r1, #0x0
    cmp r0, r1
    movne r0, #0x1
    add sp, sp, #0xc
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_b0:
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word func_02034834
