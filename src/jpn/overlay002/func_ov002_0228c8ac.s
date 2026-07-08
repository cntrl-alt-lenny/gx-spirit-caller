; func_ov002_0228c8ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern func_0202b89c
        .extern func_0202b8cc
        .global func_ov002_0228c8ac
        .arm
func_ov002_0228c8ac:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    ldr r4, _LIT0
    str r0, [sp]
    and r0, r0, #0x1
    mul r4, r0, r4
    ldr r0, _LIT1
    mvn r8, #0x0
    ldr r0, [r0, r4]
    str r1, [sp, #0x4]
    mov sl, r2
    mov r9, r3
    str r8, [sp, #0x8]
    cmp r0, #0x0
    mov r5, #0x0
    bls .L_174
    ldr r0, _LIT2
    add fp, r0, r4
    add r7, fp, #0x120
.L_4c:
    ldr r0, [sp]
    ldr r3, [sp, #0x4]
    mov r1, #0xb
    mov r2, r5
    blx r3
    cmp r0, #0x0
    beq .L_160
    ldr r1, [r7]
    cmp sl, #0x0
    mov r1, r1, lsl #0x13
    mov r0, #0x0
    mov r6, r1, lsr #0x13
    cmpne r9, #0x0
    beq .L_b4
    mov r0, r6
    bl func_0202b89c
    mov r4, r0
    mov r0, r6
    bl func_0202b8cc
    cmp r4, r0
    mov r0, r6
    ble .L_ac
    bl func_0202b89c
    b .L_d8
.L_ac:
    bl func_0202b8cc
    b .L_d8
.L_b4:
    cmp sl, #0x0
    beq .L_c8
    mov r0, r6
    bl func_0202b89c
    b .L_d8
.L_c8:
    cmp r9, #0x0
    beq .L_d8
    mov r0, r6
    bl func_0202b8cc
.L_d8:
    cmp r8, #0x0
    movlt r8, r0
    strlt r5, [sp, #0x8]
    blt .L_160
    mov r1, #0x0
    cmp sl, #0x0
    cmpgt r0, r8
    movgt r1, #0x1
    cmp sl, #0x0
    cmplt r0, r8
    movlt r1, #0x1
    cmp r9, #0x0
    cmpgt r0, r8
    movgt r1, #0x1
    cmp r9, #0x0
    cmplt r0, r8
    movlt r1, #0x1
    cmp r1, #0x0
    beq .L_160
    cmp sl, #0x0
    cmpgt r0, r8
    movgt r8, r0
    cmp sl, #0x0
    cmplt r0, r8
    movlt r8, r0
    cmp r9, #0x0
    cmpgt r0, r8
    movgt r8, r0
    str r5, [sp, #0x8]
    cmp r9, #0x0
    bge .L_160
    cmp r0, r8
    movge r0, r8
    mov r8, r0
.L_160:
    add r7, r7, #0x4
    add r5, r5, #0x1
    ldr r0, [fp, #0xc]
    cmp r5, r0
    bcc .L_4c
.L_174:
    ldr r0, [sp, #0x8]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf098
_LIT2: .word data_ov002_022cf08c
