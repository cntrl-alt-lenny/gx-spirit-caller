; func_0200b234 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .global func_0200b234
        .arm
func_0200b234:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    movs r7, r3
    mov sl, r0
    mov r9, r1
    mov r8, r2
    mov r5, #0x0
    beq .L_9c
    mov r6, sl
    mov fp, r5
    mvn r4, #0x0
.L_28:
    mov r0, fp
    mov r1, r6
    mov r2, #0x20
    bl Fill32
    ldr r0, [r9, r5, lsl #0x5]
    add r1, r9, r5, lsl #0x5
    strb r0, [sl, r5, lsl #0x5]
    add r0, sl, r5, lsl #0x5
    ldrsh r2, [r1, #0x4]
    add r5, r5, #0x1
    cmp r5, r7
    strh r2, [r0, #0x4]
    ldrsh r2, [r1, #0x6]
    add r6, r6, #0x20
    strh r2, [r0, #0x6]
    ldr r2, [r1, #0x8]
    add r2, r8, r2
    str r2, [r0, #0x8]
    ldr r2, [r1, #0xc]
    str r2, [r0, #0xc]
    ldr r2, [r1, #0x10]
    add r2, r8, r2
    str r2, [r0, #0x10]
    ldr r2, [r1, #0x14]
    str r2, [r0, #0x14]
    str r4, [r0, #0x18]
    ldr r1, [r1, #0x18]
    str r1, [r0, #0x1c]
    bcc .L_28
.L_9c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
