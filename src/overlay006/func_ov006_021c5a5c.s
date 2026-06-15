; func_ov006_021c5a5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02037208
        .global func_ov006_021c5a5c
        .arm
func_ov006_021c5a5c:
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x4c]
    mov r4, #0x0
    cmp r1, #0x0
    bne .L_7fc
    add r1, r0, r1, lsl #0x4
    ldr r3, [r1, #0x70]
    ldr r2, [r1, #0x6c]
    ldr r1, [r0, #0x22c]
    add r2, r3, r2
    cmp r2, r1
    bge .L_7fc
    mov r4, #0x1
    str r4, [r0, #0x44]
    ldr r1, [r0, #0x4c]
    add r1, r0, r1, lsl #0x4
    ldr r2, [r1, #0x70]
    ldr r1, [r1, #0x6c]
    add r1, r2, r1
    add r1, r0, r1, lsl #0x4
    ldr r1, [r1, #0x7c]
    str r1, [r0, #0x48]
.L_7fc:
    cmp r4, #0x0
    mov r2, #0x0
    mov r3, #0x1
    beq .L_81c
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_02037208
    b .L_840
.L_81c:
    cmp r4, #0x0
    beq .L_834
    mov r0, #0x46
    sub r1, r0, #0x47
    bl func_02037208
    b .L_840
.L_834:
    mov r0, #0x43
    sub r1, r0, #0x44
    bl func_02037208
.L_840:
    mov r0, r4
    ldmia sp!, {r4, pc}
