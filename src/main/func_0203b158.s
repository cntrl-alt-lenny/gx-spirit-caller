; func_0203b158 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_01ff8000
        .global func_0203b158
        .arm
func_0203b158:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x1c
    mov sl, r0
    ldr r0, [sl, #0x78]
    mov r9, r1
    ldr r2, [r0, r9, lsl #0x5]
    ldr r1, _LIT0
    add r4, sl, #0x60
    umull r1, r5, r2, r1
    sub r1, r2, r5
    add r5, r5, r1, lsr #0x1
    mov r5, r5, lsr #0x9
    mov r1, #0x3f8
    mul r1, r5, r1
    ldr r3, [sl, #0x84]
    add r8, r0, r9, lsl #0x5
    add r0, r4, r9, lsl #0x2
    add r2, r3, #0x400
    str r1, [sp]
    str r0, [sp, #0x4]
    add r0, r5, #0x1
    add r3, r3, r9, lsl #0x9
    add r2, r2, r9, lsl #0x9
    mov r1, r5, lsl #0x10
    str r0, [sp, #0x8]
    mov r0, r1, lsr #0x10
    str r0, [sp, #0xc]
    mvn r0, #0x29
    str r3, [sp, #0x14]
    str r2, [sp, #0x18]
    mov fp, r5, lsl #0x9
    mov r4, #0x0
    str r0, [sp, #0x10]
.L_284:
    ldrh r0, [r8, #0x12]
    cmp r5, r0
    beq .L_374
    ldr r2, [sl, #0x74]
    ldr r0, [sp, #0x8]
    ldr r1, [r2, #0x2c]
    ldr r6, [r2, #0x34]
    cmp r0, r1
    ldr r3, [r2, #0x30]
    ldrcs r6, [r2, #0x3c]
    ldrcs r3, [r2, #0x38]
    ldr r1, [r2, #0x28]
    ldr r0, [sl, #0x68]
    mov r7, #0x0
    add r1, r1, r0
    ldrh r2, [sl, #0xb8]
    movcs r7, #0x1
    mul r0, r4, r3
    mla r1, r2, fp, r1
    cmp r9, #0x0
    bne .L_304
    ldr r2, _LIT1
    ldrh r2, [r2]
    rsb ip, r2, #0xb6
    ldr r2, [sp, #0x10]
    cmp ip, r2
    addle r2, ip, #0x7
    addle ip, r2, #0x100
    cmp ip, #0x0
    addlt sp, sp, #0x1c
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_304:
    add r2, sp, #0x14
    add r1, r1, r0
    ldr r0, [sp, #0x4]
    ldr r2, [r2, r4, lsl #0x2]
    bl func_01ff8000
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp]
    cmp r7, #0x0
    add r0, r0, r6
    str r0, [r8, #0xc]
    ldr r0, [sp, #0xc]
    strh r0, [r8, #0x12]
    beq .L_374
    ldr r0, [sl, #0x74]
    ldr r0, [r0, #0x20]
    str r0, [r8, #0xc]
    ldr r1, [sl, #0x74]
    ldrb r0, [r1, #0x19]
    cmp r0, #0x0
    bne .L_374
    ldr r0, [r1, #0x24]
    str r0, [r8, #0xc]
    ldrh r0, [sl, #0xb0]
    orr r0, r0, #0x2
    strh r0, [sl, #0xb0]
.L_374:
    add r8, r8, #0xc
    add r4, r4, #0x1
    ldrh r0, [sl, #0xb8]
    cmp r4, r0
    bcc .L_284
    mov r0, #0x1
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x02040811
_LIT1: .word 0x04000006
