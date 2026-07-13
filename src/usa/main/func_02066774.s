; func_02066774 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101684
        .extern data_0210168c
        .extern data_02101848
        .extern func_02067220
        .extern func_020a9698
        .global func_02066774
        .arm
func_02066774:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x194
    mov r8, r2
    sub r2, r8, #0x1
    mov r3, #0x0
    mov sl, r0
    cmp r2, #0x1
    movhi r0, #0x1
    mov r9, r1
    str r3, [sp, #0x18c]
    strhi r0, [sp]
    bhi .L_44
    ldr r1, [sl, #0x10c]
    ldr r2, [sl, #0x98]
    mov r0, r8
    blx r2
    str r0, [sp]
.L_44:
    ldr r2, [sl, #0x10c]
    ldr r3, [sl, #0x94]
    add r1, sp, #0x8c
    mov r0, r8
    blx r3
    ldr r1, [sp, #0x18c]
    mov r0, #0x0
    str r0, [sp, #0x4]
    cmp r1, #0x0
    addle sp, sp, #0x194
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r6, sp, #0x8c
    str r0, [sp, #0x8]
    mov r4, #0x5c
.L_7c:
    ldrb r1, [r6]
    ldr r0, _LIT0
    ldr fp, [r0, r1, lsl #0x2]
    cmp fp, #0x0
    ldreq fp, _LIT1
    cmp r8, #0x0
    bne .L_f0
    mov r1, fp
    mov r0, r9
    bl func_02067220
    ldr r0, [r9, #0x800]
    mov r1, r9
    sub r0, r0, #0x1
    strb r4, [r9, r0]
    ldr r5, [r9, #0x800]
    ldrb r0, [r6]
    ldr r2, [sl, #0x10c]
    ldr r3, [sl, #0x88]
    blx r3
    ldr r0, [r9, #0x800]
    cmp r5, r0
    bne .L_e0
    ldr r1, _LIT2
    mov r0, r9
    bl func_02067220
.L_e0:
    ldr r0, [r9, #0x800]
    sub r0, r0, #0x1
    strb r4, [r9, r0]
    b .L_1a8
.L_f0:
    ldr r0, [sp]
    ldr r7, [sp, #0x8]
    cmp r0, #0x0
    ble .L_1a8
.L_100:
    ldr r1, _LIT3
    add r0, sp, #0xc
    mov r2, fp
    mov r3, r7
    bl func_020a9698
    mov r0, r9
    add r1, sp, #0xc
    bl func_02067220
    ldr r0, [r9, #0x800]
    cmp r8, #0x1
    sub r0, r0, #0x1
    strb r4, [r9, r0]
    ldr r5, [r9, #0x800]
    bne .L_154
    ldrb r0, [r6]
    mov r1, r7
    mov r2, r9
    ldr r3, [sl, #0x10c]
    ldr ip, [sl, #0x8c]
    blx ip
    b .L_174
.L_154:
    cmp r8, #0x2
    bne .L_174
    ldrb r0, [r6]
    mov r1, r7
    mov r2, r9
    ldr r3, [sl, #0x10c]
    ldr ip, [sl, #0x90]
    blx ip
.L_174:
    ldr r0, [r9, #0x800]
    cmp r5, r0
    bne .L_18c
    ldr r1, _LIT2
    mov r0, r9
    bl func_02067220
.L_18c:
    ldr r0, [r9, #0x800]
    add r7, r7, #0x1
    sub r0, r0, #0x1
    strb r4, [r9, r0]
    ldr r0, [sp]
    cmp r7, r0
    blt .L_100
.L_1a8:
    ldr r0, [sp, #0x4]
    ldr r1, [sp, #0x18c]
    add r0, r0, #0x1
    add r6, r6, #0x1
    str r0, [sp, #0x4]
    cmp r0, r1
    blt .L_7c
    add sp, sp, #0x194
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02101848
_LIT1: .word data_02101684
_LIT2: .word data_0210168c
_LIT3: .word data_0210168c+0x4
