; func_0200c428 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern Task_PostLocked
        .global func_0200c428
        .arm
func_0200c428:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r5, r0
    ldr r0, [r5, #0x27c]
    mov r7, r1
    cmp r0, #0x0
    mov r4, r2
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, [r5, #0x1c]
    mov r0, #0xc
    mla r6, r7, r0, r1
    ldr r0, [r5, #0x274]
    cmp r0, #0x0
    bne .L_490
    ldr r0, [r6, #0x4]
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r1, r0
    str r0, [r5, #0x274]
    ldmia r6, {r0, r2}
    bl Copy32
    str r7, [r5, #0x278]
.L_490:
    cmp r4, #0x0
    bne .L_4a8
    ldr r0, [r5, #0x274]
    ldmia r6, {r1, r2}
    bl Copy32
    b .L_550
.L_4a8:
    movge r1, r4
    rsblt r1, r4, #0x0
    ldr r0, [r6, #0x4]
    rsb r2, r1, #0x10
    movs r0, r0, lsr #0x1
    mov r3, #0x0
    beq .L_550
    mov ip, r3
    rsb lr, r1, r1, lsl #0x5
.L_4cc:
    ldr r0, [r5, #0x274]
    cmp r4, #0x0
    ldrh r8, [r0, ip]
    ldr r1, [r6]
    mov r7, r8, asr #0x5
    mov r0, r8, asr #0xa
    and r8, r8, #0x1f
    and r7, r7, #0x1f
    and r0, r0, #0x1f
    mulle sl, r8, r2
    mulle r9, r7, r2
    mulle r8, r0, r2
    ble .L_50c
    mla sl, r8, r2, lr
    mla r9, r7, r2, lr
    mla r8, r0, r2, lr
.L_50c:
    mov fp, sl, asr #0x3
    mov r0, r9, asr #0x3
    mov r7, r8, asr #0x3
    add r0, r9, r0, lsr #0x1c
    add r7, r8, r7, lsr #0x1c
    add sl, sl, fp, lsr #0x1c
    mov r8, sl, asr #0x4
    mov r0, r0, asr #0x4
    mov r7, r7, asr #0x4
    orr r0, r8, r0, lsl #0x5
    orr r0, r0, r7, lsl #0xa
    strh r0, [r1, ip]
    ldr r0, [r6, #0x4]
    add r3, r3, #0x1
    cmp r3, r0, lsr #0x1
    add ip, ip, #0x2
    bcc .L_4cc
.L_550:
    ldr r1, [r5, #0x7c]
    mov r0, #0x1
    orr r1, r1, #0x10000000
    str r1, [r5, #0x7c]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
