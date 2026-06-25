; func_0204109c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe73c
        .extern data_020fe75c
        .extern data_020fe77c
        .extern data_020fe798
        .extern func_020aace8
        .extern func_020aad04
        .global func_0204109c
        .arm
func_0204109c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r1
    ldr r4, [r8, #0x8]
    ldr r1, [r8, #0x4]
    add r0, r0, #0x1000
    cmp r4, r1
    ldr r5, [r0, #0x10]
    ldr r4, [r0, #0x14]
    mov r7, r2
    mov r6, r3
    movgt r0, #0x0
    ldmgtia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r7
    bl func_020aace8
    mov r1, r0
    ldr r0, _LIT0
    add r1, r1, #0x1
    blx r5
    ldr r2, [r8]
    ldr r1, [r8, #0x8]
    str r0, [r2, r1, lsl #0x3]
    ldr r3, [r8, #0x8]
    ldr r2, [r8]
    ldr r0, [r2, r3, lsl #0x3]
    cmp r0, #0x0
    beq .L_394
    mov r0, r6
    bl func_020aace8
    mov r1, r0
    ldr r0, _LIT1
    add r1, r1, #0x1
    blx r5
    ldr r2, [r8]
    ldr r1, [r8, #0x8]
    add r1, r2, r1, lsl #0x3
    str r0, [r1, #0x4]
    ldr r3, [r8, #0x8]
    ldr r2, [r8]
    mov r1, r3, lsl #0x3
    add r0, r2, r3, lsl #0x3
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    beq .L_394
    ldr r0, [r2, r1]
    mov r1, r7
    bl func_020aad04
    ldr r2, [r8]
    ldr r0, [r8, #0x8]
    mov r1, r6
    add r0, r2, r0, lsl #0x3
    ldr r0, [r0, #0x4]
    bl func_020aad04
    ldr r1, [r8, #0x8]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r8, #0x8]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_394:
    ldr r1, [r2, r3, lsl #0x3]
    cmp r1, #0x0
    beq .L_3bc
    ldr r0, _LIT2
    mov r2, #0x0
    blx r4
    ldr r1, [r8]
    ldr r0, [r8, #0x8]
    mov r2, #0x0
    str r2, [r1, r0, lsl #0x3]
.L_3bc:
    ldr r1, [r8]
    ldr r0, [r8, #0x8]
    add r0, r1, r0, lsl #0x3
    ldr r1, [r0, #0x4]
    cmp r1, #0x0
    beq .L_3f4
    ldr r0, _LIT3
    mov r2, #0x0
    blx r4
    ldr r1, [r8]
    ldr r0, [r8, #0x8]
    mov r2, #0x0
    add r0, r1, r0, lsl #0x3
    str r2, [r0, #0x4]
.L_3f4:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_020fe73c
_LIT1: .word data_020fe75c
_LIT2: .word data_020fe77c
_LIT3: .word data_020fe798
