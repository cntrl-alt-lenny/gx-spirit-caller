; func_0208aba8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208aba8
        .arm
func_0208aba8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x8
    mov r5, r2, lsr #0x1
    mov r4, #0x0
    mov r2, #0x8000
    ldr r8, _LIT0
    add r7, sp, #0x0
    rsb r9, r2, #0x0
    add lr, r0, r5, lsl #0x1
    add r2, r1, r5, lsl #0x1
.L_220:
    add sl, lr, r4, lsl #0x1
    add r6, r2, r4, lsl #0x1
    ldrsh ip, [sl, #-4]
    ldrsh sl, [r6, #-4]
    mov r6, #0x8000
    rsb r6, r6, #0x0
    sub sl, ip, sl
    cmp sl, r6
    movlt sl, r9
    blt .L_250
    cmp sl, r8
    movgt sl, r8
.L_250:
    mov r6, r4, lsl #0x1
    add r4, r4, #0x1
    strh sl, [r7, r6]
    cmp r4, #0x2
    blt .L_220
    sub r4, r5, #0x1
    add lr, r0, r4, lsl #0x1
    add r2, r0, #0x4
    cmp lr, r2
    add ip, r1, r4, lsl #0x1
    bcc .L_2f4
    mov r4, #0x8000
    ldr r6, _LIT0
    rsb r5, r4, #0x0
.L_288:
    ldrsh r9, [lr, #-4]
    ldrsh r8, [ip, #-4]
    ldrsh r7, [lr]
    ldrsh r4, [ip]
    subs r8, r9, r8
    add r7, r7, r8
    sub r8, r4, r8
    bmi .L_2c4
    cmp r7, r6
    strlth r7, [lr]
    strgeh r6, [lr]
    cmp r8, r5
    strgth r8, [ip]
    strleh r5, [ip]
    b .L_2e4
.L_2c4:
    mov r4, #0x8000
    rsb r4, r4, #0x0
    cmp r7, r4
    strgth r7, [lr]
    strleh r5, [lr]
    cmp r8, r6
    strlth r8, [ip]
    strgeh r6, [ip]
.L_2e4:
    sub lr, lr, #0x2
    cmp lr, r2
    sub ip, ip, #0x2
    bcs .L_288
.L_2f4:
    mov r4, #0x8000
    ldr r6, _LIT0
    mov r2, #0x1
    rsb ip, r4, #0x0
.L_304:
    mov r5, r2, lsl #0x1
    add r4, r3, r2, lsl #0x2
    ldrsh r5, [r0, r5]
    ldr r4, [r4, #0x18]
    add r4, r5, r4
    cmp r4, ip
    movlt r4, ip
    blt .L_32c
    cmp r4, r6
    movgt r4, r6
.L_32c:
    mov r5, r2, lsl #0x1
    strh r4, [r0, r5]
    add r4, r3, r2, lsl #0x2
    ldrsh r5, [r1, r5]
    ldr r4, [r4, #0x18]
    sub r5, r5, r4
    cmp r5, ip
    movlt r5, ip
    blt .L_358
    cmp r5, r6
    movgt r5, r6
.L_358:
    mov r4, r2, lsl #0x1
    strh r5, [r1, r4]
    subs r2, r2, #0x1
    bpl .L_304
    mov r4, #0x0
    add r2, sp, #0x0
.L_370:
    mov r0, r4, lsl #0x1
    ldrsh r1, [r2, r0]
    add r0, r3, r4, lsl #0x2
    add r4, r4, #0x1
    str r1, [r0, #0x18]
    cmp r4, #0x2
    blt .L_370
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00007fff
