; func_02059744 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100504
        .extern data_021005bc
        .extern data_021005d0
        .extern func_020453e8
        .extern func_02055298
        .extern func_020560a8
        .extern func_02056594
        .extern func_020586c8
        .extern func_0205999c
        .extern func_0205be60
        .extern func_0205bf18
        .extern func_0205ffc0
        .extern func_020604b0
        .extern func_020a73d4
        .global func_02059744
        .arm
func_02059744:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r8, r0
    ldr r4, [r8]
    mov r7, r1
    ldr r1, [r4, #0x1d8]
    mov r6, r2
    mov r5, r3
    cmp r1, #0x4
    bne .L_16dc
    bl func_02056594
    cmp r0, #0x0
    addne sp, sp, #0x10
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_16dc:
    ldr r0, [r4, #0x1d8]
    cmp r0, #0x0
    beq .L_1700
    ldr r1, _LIT0
    mov r0, r8
    bl func_0205ffc0
    add sp, sp, #0x10
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1700:
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    beq .L_1720
    cmp r0, #0x1
    bne .L_172c
    mov r0, #0x1
    str r0, [r4, #0x10c]
    b .L_1744
.L_1720:
    mov r0, #0x0
    str r0, [r4, #0x10c]
    b .L_1744
.L_172c:
    ldr r1, _LIT1
    mov r0, r8
    bl func_0205ffc0
    add sp, sp, #0x10
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1744:
    mov r3, #0x1
    mov r1, r7
    add r0, r4, #0x110
    mov r2, #0x1f
    str r3, [r4, #0x10c]
    bl func_020604b0
    ldr r0, _LIT2
    mov r1, r6
    add r0, r4, r0
    mov r2, #0x15
    bl func_020604b0
    mov r1, r5
    add r0, r4, #0x144
    mov r2, #0x33
    bl func_020604b0
    ldr r0, _LIT3
    ldr r1, [sp, #0x28]
    add r0, r4, r0
    mov r2, #0x1f
    bl func_020604b0
    add r0, r4, #0x144
    bl func_02055298
    mov r0, #0x308
    bl func_020453e8
    movs r4, r0
    bne .L_17c4
    ldr r1, _LIT4
    mov r0, r8
    bl func_0205ffc0
    add sp, sp, #0x10
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_17c4:
    mov r1, #0x0
    mov r2, #0x308
    bl func_020a73d4
    ldr r0, [sp, #0x3c]
    ldr r1, [sp, #0x2c]
    str r0, [r4, #0x304]
    ldrsb r0, [r1]
    cmp r0, #0x0
    beq .L_1818
    ldr r0, [sp, #0x30]
    ldrsb r0, [r0]
    cmp r0, #0x0
    beq .L_1818
    add r0, r4, #0xc2
    mov r2, #0x100
    bl func_020604b0
    ldr r0, _LIT5
    ldr r1, [sp, #0x30]
    add r0, r4, r0
    mov r2, #0x100
    bl func_020604b0
.L_1818:
    ldr r1, [sp, #0x34]
    cmp r1, #0x0
    beq .L_1834
    ldr r0, _LIT6
    mov r2, #0x41
    add r0, r4, r0
    bl func_020604b0
.L_1834:
    ldr r1, [sp, #0x40]
    ldr r0, [sp, #0x44]
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r5, [sp, #0x48]
    add r3, sp, #0xc
    mov r0, r8
    mov r2, r4
    mov r1, #0x0
    str r5, [sp, #0x8]
    bl func_0205be60
    cmp r0, #0x0
    addne sp, sp, #0x10
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, [sp, #0xc]
    mov r0, r8
    bl func_0205999c
    movs r4, r0
    beq .L_18ac
    ldr r1, [sp, #0xc]
    mov r0, r8
    str r4, [r1, #0x1c]
    ldr r1, [sp, #0xc]
    bl func_0205bf18
    mov r0, r8
    mov r1, #0x0
    bl func_020586c8
    add sp, sp, #0x10
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_18ac:
    ldr r1, [sp, #0xc]
    ldr r0, [r1, #0x8]
    cmp r0, #0x0
    beq .L_18d4
    ldr r1, [r1, #0x18]
    mov r0, r8
    bl func_020560a8
    cmp r0, #0x0
    addne sp, sp, #0x10
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_18d4:
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_021005bc
_LIT1: .word data_021005d0
_LIT2: .word 0x0000012f
_LIT3: .word 0x00000177
_LIT4: .word data_02100504
_LIT5: .word 0x000001c2
_LIT6: .word 0x000002c2
