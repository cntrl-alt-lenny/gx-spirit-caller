; func_0206d7e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206d58c
        .extern func_0206d74c
        .global func_0206d7e0
        .arm
func_0206d7e0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x1c
    mov sl, r0
    ldr r4, [sl, #0x68]
    ldrsb r0, [sl, #0x73]
    ldr r4, [r4, #0x10c]
    mov r9, r1
    cmp r0, #0x1
    ldr r0, [r4, #0x48]
    mov r8, r2
    str r3, [sp, #0xc]
    ldr r7, [sp, #0x40]
    ldr r6, [sp, #0x44]
    mov r4, #0x0
    bne .L_5c
    sub r0, r0, #0x2a
    cmp r8, r0
    addgt sp, sp, #0x1c
    mvngt r0, #0x22
    ldmgtia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxgt lr
    str r8, [sp, #0x10]
    b .L_6c
.L_5c:
    sub r0, r0, #0x36
    str r0, [sp, #0x10]
    cmp r8, r0
    strle r8, [sp, #0x10]
.L_6c:
    cmp r8, #0x0
    ble .L_108
    and fp, r6, #0x1
.L_78:
    ldr r2, [sp, #0x10]
    mov r0, sl
    mov r1, r8
    add r3, sp, #0x14
    str r6, [sp]
    bl func_0206d74c
    mov r5, r0
    cmp r5, #0x0
    ble .L_e0
    ldr r0, [sp, #0xc]
    mov r1, r9
    str r0, [sp]
    str r7, [sp, #0x4]
    str r6, [sp, #0x8]
    ldr r3, [sp, #0x14]
    mov r0, sl
    mov r2, r5
    bl func_0206d58c
    cmp r0, #0x0
    addle sp, sp, #0x1c
    mvnle r0, #0x5
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxle lr
    add r9, r9, r5
    sub r8, r8, r5
    add r4, r4, r5
.L_e0:
    cmp fp, #0x0
    bne .L_100
    cmp r5, #0x0
    bgt .L_108
    add sp, sp, #0x1c
    mvn r0, #0x5
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
.L_100:
    cmp r8, #0x0
    bgt .L_78
.L_108:
    mov r0, r4
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
