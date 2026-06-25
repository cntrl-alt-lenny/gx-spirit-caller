; func_ov002_022a04b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cbc38
        .extern data_ov002_022cbc54
        .extern data_ov002_022cbc70
        .extern data_ov002_022cbc88
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0208df94
        .extern func_02094550
        .global func_ov002_022a04b0
        .arm
func_ov002_022a04b0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x28
    mov r8, r0
    add r0, sp, #0x0
    mov r7, r1
    mov r4, #0x0
    ldr r6, _LIT0
    bl func_0201d47c
    ldr r0, [r8, #0x4]
    cmp r0, #0xb
    beq .L_44
    cmp r0, #0x20
    bne .L_5c
    mov r5, #0x2
    str r5, [r8, #0x34]
    ldr r0, _LIT1
    b .L_84
.L_44:
    mov r0, #0x16
    str r0, [r8, #0x34]
    ldr r0, _LIT2
    mov r5, #0x7
    mov r4, #0x1
    b .L_84
.L_5c:
    cmp r0, #0x0
    ldrge r0, _LIT3
    movge r5, #0x3
    bge .L_84
    mov r0, #0x15
    str r0, [r8, #0x34]
    ldr r0, _LIT4
    mov r5, #0x6
    mov r6, #0x1040
    mov r4, #0x1
.L_84:
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldrh r1, [sp, #0x14]
    str r0, [sp]
    cmp r4, #0x0
    bic r0, r1, #0xf
    orr r0, r0, #0x8
    strh r0, [sp, #0x14]
    ldr r1, [sp, #0x18]
    movne ip, #0x0
    bic r1, r1, #0x1c000
    addeq ip, r8, #0x94
    orr r3, r1, #0x1c000
    ldrh r0, [sp, #0x14]
    mov r2, r5, lsl #0x9
    str ip, [sp, #0x8]
    orr r1, r0, #0x10
    add r0, sp, #0x0
    str r6, [sp, #0xc]
    str r3, [sp, #0x18]
    strh r2, [sp, #0x10]
    strh r1, [sp, #0x14]
    bl func_0201e5b8
    ldr r0, [sp]
    bl Task_Invoke
    cmp r4, #0x0
    addne sp, sp, #0x28
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [r8, #0x4]
    cmp r0, #0x20
    bne .L_120
    bl func_0208df94
    mov r1, r0
    add r0, r8, #0x94
    mov r2, #0x80
    bl func_02094550
    add sp, sp, #0x28
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_120:
    str r7, [r8, #0x34]
    bl func_0208df94
    mov r1, r0
    add r0, r8, #0x94
    mov r2, #0x40
    bl func_02094550
    sub r5, r7, #0x2
    cmp r5, #0x0
    mov r6, #0x0
    ble .L_170
    mov r4, #0x40
.L_14c:
    bl func_0208df94
    add r1, r6, #0x1
    add r1, r0, r1, lsl #0x6
    mov r2, r4
    add r0, r8, #0xd4
    bl func_02094550
    add r6, r6, #0x1
    cmp r6, r5
    blt .L_14c
.L_170:
    bl func_0208df94
    add r1, r6, #0x1
    add r1, r0, r1, lsl #0x6
    add r0, r8, #0x114
    mov r2, #0x40
    bl func_02094550
    add sp, sp, #0x28
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x0000dc40
_LIT1: .word data_ov002_022cbc38
_LIT2: .word data_ov002_022cbc54
_LIT3: .word data_ov002_022cbc88
_LIT4: .word data_ov002_022cbc70
