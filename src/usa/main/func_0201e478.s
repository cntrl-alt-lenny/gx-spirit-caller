; func_0201e478 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208fc48
        .extern func_0208fca8
        .extern func_0209281c
        .extern func_020b3988
        .global func_0201e478
        .arm
func_0201e478:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    ldr r1, [r6, #0xc]
    mov r7, r0
    add r0, r1, #0x3
    cmp r1, #0x0
    add r5, r6, #0x20
    bic r4, r0, #0x3
    beq .L_718
    str r5, [r7, #0x4]
    ldrb r1, [r6, #0xa]
    ldr r0, [r6, #0xc]
    bl func_020b3988
    strh r0, [r7, #0x12]
    ldrh r1, [r7, #0x14]
    ldrb r0, [r6, #0x9]
    bic r1, r1, #0xf000
    mov r0, r0, lsl #0x1c
    orr r0, r1, r0, lsr #0x10
    strh r0, [r7, #0x14]
    ldrh r1, [r7, #0x14]
    ldrb r0, [r6, #0x8]
    bic r1, r1, #0x60
    mov r0, r0, lsl #0x1e
    orr r0, r1, r0, lsr #0x19
    strh r0, [r7, #0x14]
    ldrh r0, [r6, #0x18]
    ldr r1, [r7, #0x18]
    bic r1, r1, #0xfe0000
    mov r0, r0, lsl #0x19
    orr r0, r1, r0, lsr #0x8
    str r0, [r7, #0x18]
.L_718:
    ldr r1, [r7, #0xc]
    mvn r0, #0x0
    cmp r1, r0
    ldrne r1, [r6, #0x1c]
    cmpne r1, #0x0
    beq .L_77c
    add r0, r5, r4
    bl func_0209281c
    ldrh r0, [r7, #0x14]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x4
    beq .L_758
    cmp r0, #0x9
    beq .L_76c
    b .L_77c
.L_758:
    ldr r1, [r7, #0xc]
    ldr r2, [r6, #0x1c]
    add r0, r5, r4
    bl func_0208fca8
    b .L_77c
.L_76c:
    ldr r1, [r7, #0xc]
    ldr r2, [r6, #0x1c]
    add r0, r5, r4
    bl func_0208fc48
.L_77c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
