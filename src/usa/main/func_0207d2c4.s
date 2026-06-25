; func_0207d2c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020a6c54
        .global func_0207d2c4
        .arm
func_0207d2c4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    mov r0, r1
    bl func_020a6c54
    ldr r4, [r4, #0x24]
    mov r6, #0x0
    cmp r4, #0x0
    mvn r5, #0x0
    beq .L_7c
    sub ip, r0, #0x1
    mvn r3, ip
.L_2c:
    add r2, r4, #0x10
    ldr r0, [r4, #0x4]
    add r1, ip, r2
    and r1, r3, r1
    add r0, r0, r2
    cmp r1, r0
    bcs .L_70
    sub lr, r0, r1
    cmp r6, lr
    sub r0, r1, r2
    bcc .L_68
    cmp r6, lr
    bne .L_70
    cmp r5, r0
    bls .L_70
.L_68:
    mov r6, lr
    mov r5, r0
.L_70:
    ldr r4, [r4, #0xc]
    cmp r4, #0x0
    bne .L_2c
.L_7c:
    mov r0, r6
    ldmia sp!, {r4, r5, r6, pc}
