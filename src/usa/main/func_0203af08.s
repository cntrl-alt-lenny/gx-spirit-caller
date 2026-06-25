; func_0203af08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_01ff8000
        .extern func_02094500
        .global func_0203af08
        .arm
func_0203af08:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x24
    mov sl, r0
    ldr r0, [sl, #0x78]
    mov r4, #0x0
    add r0, r0, r2, lsl #0x5
    str r2, [sp, #0x4]
    str r0, [sp, #0x18]
    mov r8, r0
    ldrh r5, [sl, #0xb2]
    ldr r0, [sp, #0x4]
    add r2, sl, #0x60
    add r0, r2, r0, lsl #0x2
    str r0, [sp, #0x10]
    mov r0, r5, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp, #0x1c]
    mvn r0, #0x29
    ldrb r6, [sl, #0xbe]
    str r1, [sp]
    str r4, [sp, #0x14]
    str r0, [sp, #0x20]
.L_58:
    ldr r0, [r8, #0xc]
    ldrh r7, [r8, #0x10]
    cmp r7, r5
    bge .L_198
    mov r1, #0x0
    sub r9, r5, r7
    str r1, [sp, #0xc]
    ldr r2, [sl, #0x70]
    add r1, r0, r9
    cmp r1, r2
    movcs r1, #0x1
    strcs r1, [sp, #0xc]
    ldr r1, [sp]
    subcs r9, r2, r0
    ldr r1, [r1, r4, lsl #0x2]
    ldr r2, [sl, #0x74]
    mla r1, r7, r6, r1
    str r1, [sp, #0x8]
    ldr r1, [sl, #0x68]
    ldr r2, [r2, #0x28]
    cmp r4, #0x0
    add r1, r2, r1
    mla r1, r0, r6, r1
    ldrne r0, [sl, #0x6c]
    mul fp, r9, r6
    addne r1, r1, r0
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bne .L_f8
    ldr r0, _LIT0
    ldrh r0, [r0]
    rsb r2, r0, #0xb6
    ldr r0, [sp, #0x20]
    cmp r2, r0
    addle r0, r2, #0x7
    addle r2, r0, #0x100
    cmp r2, #0x0
    addlt sp, sp, #0x24
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_f8:
    ldr r0, [sp, #0x10]
    ldr r2, [sp, #0x8]
    mov r3, fp
    bl func_01ff8000
    cmp r0, #0x0
    addeq sp, sp, #0x24
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp, #0xc]
    add r7, r7, r9
    cmp r0, #0x0
    ldr r0, [r8, #0xc]
    add r0, r0, r9
    str r0, [r8, #0xc]
    strh r7, [r8, #0x10]
    beq .L_198
    ldr r0, [sl, #0x74]
    ldr r0, [r0, #0x20]
    str r0, [r8, #0xc]
    ldr r0, [sl, #0x74]
    ldrb r0, [r0, #0x19]
    cmp r0, #0x0
    bne .L_198
    sub r1, r5, r9
    cmp r1, #0x0
    ble .L_174
    mul r2, r1, r6
    ldr r0, [sp, #0x8]
    mov r1, #0x0
    add r0, r0, fp
    bl func_02094500
.L_174:
    ldr r0, [sp, #0x1c]
    mov r7, r5
    strh r0, [r8, #0x10]
    ldr r0, [sl, #0x74]
    ldr r0, [r0, #0x24]
    str r0, [r8, #0xc]
    ldrh r0, [sl, #0xb0]
    orr r0, r0, #0x2
    strh r0, [sl, #0xb0]
.L_198:
    ldr r0, [sp, #0x14]
    add r4, r4, #0x1
    add r0, r0, r7
    str r0, [sp, #0x14]
    ldrh r0, [sl, #0xb8]
    add r8, r8, #0xc
    cmp r4, r0
    blt .L_58
    mul r1, r5, r0
    ldr r0, [sp, #0x14]
    cmp r0, r1
    addne sp, sp, #0x24
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp, #0x18]
    ldr r1, [sp, #0x18]
    ldr r2, [r0, #0xc]
    mov r0, #0x1
    str r2, [r1]
    ldrsh r1, [r1, #0x4]
    add r2, r1, #0x1
    ldr r1, [sp, #0x18]
    strh r2, [r1, #0x4]
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x04000006
